import 'package:flutter/material.dart';

Widget CustomDrawer() {
    return Drawer(
        child: ListView(
            padding: EdgeInsets.zero,       // tira o padding
            children: <Widget>[

                DrawerHeader(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,       // deixa o conteúdo no inicio da tela
                        children: <Widget>[

                            Text('FlutWay',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,                                    
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Helvetica Neue'
                                )
                            ),

                            Text('Guia de Viagens...',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Helvetica Neue'
                                )
                            ),
                        ],
                    ),
                    
                    decoration: BoxDecoration(
                        color: Colors.blue
                    ),
                )

            ],
        ),
    );
}