import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class FavoritesPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();    // chave 'global' que será associada com o 'scaffod'

  TextStyle styles = TextStyle(       // estilos de texto
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',    
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(  // 'Consumer' escuta as mudanças em `AppData` e reconstrói a tela
      builder: (ctx, appdata, child) {

        List favorites = appdata.favoritesCities();     // executando função 'favoritesCities' de appdata

        return Scaffold(
            key: _scaffoldKey,
            appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: 'Cidades Salvas'
            ),

            drawer: CustomDrawer(
            pageContext: context
            ),

            backgroundColor: Colors.white,

            body: GridView.count(   // o 'GridView' armazenará o resultado da busca
                crossAxisCount: 2,
                children: List.generate(favorites.length, (index) {
                    return CityBox(
                        data: favorites[index],
                        onTap: (cityData) {
                            Navigator.pushNamed(context, '/city', arguments: cityData);
                        },
                    );
                }),
            )
        );
      }
    );
  }
}
