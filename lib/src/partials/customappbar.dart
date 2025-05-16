import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,     // evita que o título seje centralizado
    title: Text(
      'AppBar Personalizado',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Helvetica Neue'
      ),
    ),

    leading: IconButton(
      icon: Icon(Icons.menu, color: Colors.black, size: 30),
      onPressed: () {}    // ação do botão
    ),

    actions: <Widget>[   // propriedade 'actions' permite inserir varia coisas
      IconButton(
        icon: Icon(Icons.search, color: Colors.black, size: 30),
        onPressed: () {}
      )
    ],
  );
}
