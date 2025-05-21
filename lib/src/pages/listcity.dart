import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class ListCityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();      // chave 'global' que será associada com o 'scaffold'

  TextStyle styles = TextStyle(     // estilos de texto
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

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
        if (continentIndex < 0 || continentIndex >= appdata.data.length) {        // valida se o índice está dentro dos limites da lista
          return Scaffold(
            appBar: AppBar(title: Text('Erro')),
            body: Center(child: Text('Índice de continente inválido.')),
          );
        }

        final String continentName = appdata.data[continentIndex]['name'] as String;        // pega o nome do continente

        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: continentName,       // título do appbar com nome do continente
            showBack: true,     // mostra o botão de 'voltar'
          ),
          drawer: CustomDrawer(
            pageContext: context,
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Text('...'),     // corpo da tela
          ),
        );
      },
    );
  }
}
