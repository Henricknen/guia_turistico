import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class HomePage extends StatelessWidget {

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
          title: 'Página Home'
        ),

        drawer: CustomDrawer(
          pageContext: context
        ),

        body: Center(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,    // alinhando o conteúdo ao centro
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text('Seja Bem-vindo(a) ao', style: styles),
              ),

              Image.asset('lib/assets/terra.png',
                width: 200
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text('O melhor Guia de Viagens', style: styles),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
