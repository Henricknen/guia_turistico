import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

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
                // appdata.data[index]['name']
                return Column(
                  children: <Widget>[
                    Row(    // linha será inserido dois itens 'botões'
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,    // 'spaceBetween' insere um espaço entre os botões
                      children: <Widget>[

                        ElevatedButton(   // botão
                          child: Text("${appdata.data[index]['name']}) (${appdata.data[index]['countries'].length})"),    // nome do continente e valor que indica quantos país cadastrados nesse continente
                          onPressed: () {},
                        ),

                        ElevatedButton(
                          child: Text('Ver cidades'),
                          onPressed: () {},                        
                        ),
                        
                      ],
                    ),
                  ],
                );
            }
        )
      ),
    );
  }
}
