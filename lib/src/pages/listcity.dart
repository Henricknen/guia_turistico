import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ListCityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();      // chave 'global' que será associada com o 'scaffold'

  TextStyle styles = TextStyle(     // estilos de texto
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

  void cityBoxAction(pageContext, cityData) {
    Navigator.pushNamed(pageContext, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    final modalRoute = ModalRoute.of(context);      // recupera a rota atual
    final int? continentIndex = modalRoute?.settings.arguments as int?;     // obtém o argumento passado pela rota e tenta converter para int

    if (continentIndex == null) {       // verifica se o argumento foi passado corretamente
      return Scaffold(
        appBar: AppBar(title: Text('Erro')),
        body: Center(child: Text('Argumento ausente ou inválido.')),
      );
    }

    return Consumer<AppData>(       // 'Consumer' escuta as mudanças em `AppData` e reconstrói a tela
      builder: (ctx, appdata, child) {
        var cities = [];    // array de cidades
        for(var country in appdata.data[continentIndex]['countries']) {   // fazendo um loop nos países
          cities.addAll( country['cities'] );   // pegando as cidades dos países e 'inserindo' no array cities
        }

        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: "${appdata.data[continentIndex]['name']} (${cities.length} cidades)",
            showBack: true,     // mostra o botão de 'voltar'
          ),
          drawer: CustomDrawer(
            pageContext: context,
          ),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 3,    // utilizando 'crossAxisCount' para adiçionar 3 colunas
            children: List.generate(cities.length, (index) {
              return CityBox(
                data: cities[index],
                onTap: (cityData) {
                  cityBoxAction(context, cityData);
                },
              );
            }),
          )
        );
      }      
    );
  }
}
