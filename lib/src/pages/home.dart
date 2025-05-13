import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Home'),
                backgroundColor: Color(0xFF2E8BF1),
            ),
            body: Center(
                child: Text('Inicio'),
            ),
        );
    }
}