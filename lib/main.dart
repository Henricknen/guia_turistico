import 'package:flutter/material.dart';     // importando biblioteca 'material'
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';

import 'src/pages/preload.dart';     // importação das páginas
import 'src/pages/home.dart';
import 'src/pages/search.dart';
import 'src/pages/continent.dart';

void main() => runApp(     // 'main' é a função inicial
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AppData(),    // 'AppData' como provedor
      )
    ],
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   // rotas
      routes: {
        '/preload': (context) => PreloadPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/continent': (context) => ContinentPage(),
      },
      initialRoute: '/preload',   // rota inicial
    );
  }
}