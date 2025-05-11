import 'package:flutter/material.dart';     // Importando biblioteca 'material'
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';
import 'src/pages/home.dart';     // Importação das páginas

void main() => runApp(     // 'main' é a função inicial
  MultiProvider(    // Corrigido para 'MultiProvider'
    providers: [
      ChangeNotifierProvider(   // Corrigido para 'ChangeNotifierProvider'
        create: (context) => AppData(),    // 'AppData' como provedor
      )
    ],
    child: MyApp()    // Corrigido para 'MyApp'
  )
);

class MyApp extends StatelessWidget {  // Corrigido para 'MyApp'
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   // Rotas
      routes: {
        '/home': (context) => HomePage()  // Página inicial
      },
      initialRoute: '/home',
    );
  }
}
