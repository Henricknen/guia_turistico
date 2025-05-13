import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Consumer<AppData>(       // 'Consumer' escuta as mudanças em `AppData` e reconstrói a tela quando o estado de `AppData` mudar
            builder: (ctx, appdata, child) => Scaffold(     // apartir do 'Scaffold' e criada a estrutura pricipal da tela
                appBar: AppBar(
                    title: Text('Home'),
                    backgroundColor: Color(0xFF2E8BF1),
                ),
                body: Center(
                    child: Text('Continentes: ${appdata.data.length}'),
                ),
            )
        );
    }
}