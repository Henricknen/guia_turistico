import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class SearchPage extends StatelessWidget {
  var list = [];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();    // chave 'global' que será associada com o 'scaffod'

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(  // 'Consumer' escuta as mudanças em `AppData` e reconstrói a tela
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Busque uma cidade',
          hideSearch: true
        ),

        drawer: CustomDrawer(
          pageContext: context
        ),

        backgroundColor: Colors.white,

        body: Column(
            children: <Widget>[
              
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(   // campo de digitação
                  decoration: InputDecoration(
                    hintText: 'Digite o nome de uma cidade',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search, size: 32)
                  ),
                ),
              ),

              GridView.count(   // o 'GridView' armazenará o resultado da busca
                crossAxisCount: 2,
                shrinkWrap:  true,
                children: List.generate(list.length, (index) {
                  return CityBox(
                    data:list[index],
                    onTap: (cityData) {

                    },
                  );
                }),
              )

            ],
          ),
      ),
    );
  }
}
