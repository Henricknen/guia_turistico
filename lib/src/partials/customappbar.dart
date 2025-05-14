import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key}) 
      : preferredSize = Size.fromHeight(60.0),      // defina a altura do appBar
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,       // não centraliza o título
      title: Text(
        'AppBar Personalizado',
        style: TextStyle(       // estilizando texto da appbar
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Helvetica Neue'
        ),
      ),

      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black, size: 30),
        onPressed: () {     // ação do botão de menu
            print('Botão de menu pressionado');
        },
      ),

      actions: <Widget>[        // criando um array de icones
      IconButton(
        icon: Icon(Icons.search, color: Colors.black, size: 30),
        onPressed: () {
          print('Botão de busca pressionado');
        },
      )
      ],
    )
  }
}

