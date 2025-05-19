import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ContinentPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();    // chave 'global' que será associada com o 'scaffod'

  TextStyle styles = TextStyle(       // estilos de texto
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',    
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(  // 'Consumer' escuta as mudanças em `AppData` e reconstrói a tela
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Escolha um continente'
        ),

        drawer: CustomDrawer(
          pageContext: context
        ),

        backgroundColor: Colors.white,

        body: ListView.builder(
            itemCount: appdata.data.length,
            itemBuilder: (context, index) {                
                var cities = [];
                for(var country in appdata.data[index]['countries']) {
                  cities.addAll( country['cities'] );
                }



                return Column(
                  children: <Widget>[
                    Row(    // linha será inserido dois itens 'botões'
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,    // 'spaceBetween' insere um espaço entre os botões
                      children: <Widget>[

                        ElevatedButton(   // botão
                          child: Text("${appdata.data[index]['name']}) (${cities.length})"),    // pegando a quantidade de cidades dos continentes
                          onPressed: () {},
                        ),

                        ElevatedButton(
                          child: Text('Ver cidades'),
                          onPressed: () {},                        
                        ),
                        
                      ],
                    ),

                    Container(
                      height: 130,
                      margin: EdgeInsets.only(bottom:15),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cities.length,
                        itemBuilder: (cityContext, cityIndex) {
                          return CityBox(   // retornando o CityBox com informações das cidades
                            data:cities[cityIndex],
                            onTap: () {}
                          );
                        },
                      ),
                    )
                  ],
                );
            }
        )
      ),
    );
  }
}
