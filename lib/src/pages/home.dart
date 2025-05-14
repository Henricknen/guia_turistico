import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class HomePage extends StatelessWidget {

    TextStyle styles = TextStyle(       // styles variável de estilo
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'Helvetica Neue'
    );

    @override
    Widget build(BuildContext context) {
        return Consumer<AppData>(       // 'Consumer' escuta as mudanças em `AppData` e reconstrói a tela quando o estado de `AppData` mudar
            builder: (ctx, appdata, child) => Scaffold(     // apartir do 'Scaffold' e criada a estrutura pricipal da tela
                appBar: CustomAppBar(),

                body: Center(
                    child: Column(      // ultilizando 'Column' que permite inserir mais de um elemento
                        mainAxisAlignment: MainAxisAlignment.center,        // alinha todo o counteudo ao centro da tela
                            children: <Widget>[

                                Container(      // 'Container' permite inserir um espaçamento  na parte inferior do widget
                                    margin: EdgeInsets.only(bottom: 30),
                                    child: Text('Seja Bem vindo(a) ao', style: styles),
                                ),

                                Image.asset('lib/assets/terra.png',
                                width: 200
                                ),

                                Container(      // 'Container' permite inserir um espaçamento na parte superior do widget
                                    margin: EdgeInsets.only(top: 30),
                                    child: Text('O melhor Guia de Viagens', style: styles),
                                ),

                        ],                        
                    )
                ),
            )
        );
    }
}