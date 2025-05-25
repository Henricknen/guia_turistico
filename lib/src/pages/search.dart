import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();   // retorna o estado associado ao widget
}

class _SearchPageState extends State<SearchPage> {      // extendendo classe 'SearchPage' que transforma o widget em um 'StatefulWidget' para permitir alteração da lista 'list'
  var list = [];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();    // chave 'global' que será associada com o 'scaffold'

  void doSearch(BuildContext pageContext, String text) async {
    var newList = await Provider.of<AppData>(pageContext, listen: false).searchCity(text);   // chamando assíncrona 'searchCity' função que faz busca dentro do appdata, e armazenando o resultado na variável 'newList'

    setState(() {
      list = newList;   // jogando 'newList' dentro de 'list'
    });
  }

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
                  onChanged: (text) {
                    doSearch(context, text);   // 'onChanged' executa função 'doSearch'
                  },
                  
                  decoration: InputDecoration(
                    hintText: 'Digite o nome de uma cidade',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search, size: 32)
                  ),
                ),
              ),

              Expanded(
                child: GridView.count(   // o 'GridView' armazenará o resultado da busca
                crossAxisCount: 2,
                children: List.generate(list.length, (index) {
                  return CityBox(
                    data: list[index],
                    onTap: (cityData) {
                      Navigator.pushNamed(context, '/city', arguments: cityData);
                    },
                  );
                }),
              )
              )

            ],
          ),
      ),
    );
  }
}
