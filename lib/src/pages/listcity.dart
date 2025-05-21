import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class ListCityPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();    // chave 'global' que será associada com o 'scaffod'

  TextStyle styles = TextStyle(       // estilos de texto
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',    
  );

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    final args = route?.settings.arguments;
    // final continentIndex = ModalRoute.of(context).settings.arguments;


    if (args == null || args is! int) {
      // Se não houver argumentos válidos, mostramos uma mensagem de erro
      return Scaffold(
        appBar: AppBar(title: Text('Erro')),
        body: Center(child: Text('Argumento inválido ou não encontrado.')),
      );
    }

    final int continentIndex = args; // já garantido como int


    return Consumer<AppData>(  // 'Consumer' escuta as mudanças em `AppData` e reconstrói a tela
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: appdata.data[continentIndex]['name']['id'],      // pega o nome do continente
          showBack: true        // mostra o botão de 'voltar'
        ),

        drawer: CustomDrawer(
          pageContext: context
        ),

        backgroundColor: Colors.white,

        body: Center(
          child: Text('...')
        ),
      ),
    );
  }
}
