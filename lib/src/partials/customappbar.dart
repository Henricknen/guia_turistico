import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar({
  String title = '',
  bool hideSearch = false,
  bool showDrawer = false,
  bool showBack = false,
}) {

  IconButton drawerIcon = IconButton(
    icon: Icon(Icons.menu, color: Colors.black, size: 30),
    onPressed: () {},
  );

  IconButton backIcon = IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
    onPressed: () {},
  );

  IconButton leadingButton = drawerIcon;    // 'leadingButton' será por padrão 'drawerIcon'

  if (showBack) {
    leadingButton = backIcon;
  }

  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Helvetica Neue',
      ),
    ),

    // Pode ser null — AppBar aceita isso
    leading: leadingButton,

    actions: <Widget>[
      if (!hideSearch)
        IconButton(
          icon: Icon(Icons.search, color: Colors.black, size: 30),
          onPressed: () {},
        )
    ],
  );
}
