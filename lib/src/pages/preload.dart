import 'package:flutter/material.dart';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPageState createState() => _PreloadPageState();        // método de criação do estado
}

class _PreloadPageState extends State<PreloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preload Page'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

                Image.asset('lib/assets/terra.png',
                    width: 200,
                )

            ],
        )
      ),
    );
  }
}
