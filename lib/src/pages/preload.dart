import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPageState createState() => _PreloadPageState();
}

class _PreloadPageState extends State<PreloadPage> {
  bool loading = true;

  void requestInfo() async {
    await Future.delayed(Duration(seconds: 1));     // retarda a execução por 1 segundo

    setState(() {
      loading = true;   // marca o início da requisição
    });

    bool req = await Provider.of<AppData>(context, listen: false).requestData();      // requisição ao 'provider'

    if (req) {
      Navigator.pushReplacementNamed(context, '/home');    // se a requisição der certo o usuário será direçionando para página 'home', utilizando função 'pushReplacementNamed' para eliminar botão de retorno
    } else {
      setState(() {
        loading = false;    // finaliza a requisição, marcando 'loading' como false
      });
    }
    

  }

  @override
  void initState() {
    super.initState();      // executa o initState 'global'

    requestInfo();    // chama a função que faz a requisição
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);  // muda a cor da status bar

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/terra.png',
              width: 200,
            ),
            loading
                ? Container(    // exibe "Carregando Informações..." quando loading for true
                    margin: EdgeInsets.all(30),
                    child: Text(
                      'Carregando Informações...',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : Container(),
            loading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  )
                : Container(),
            !loading
                ? Container(    // exibe o botão "Tentar novamente..." quando loading for false
                    margin: EdgeInsets.all(30),
                    child: ElevatedButton(
                      child: Text('Tentar novamente...'),
                      onPressed: () {
                        requestInfo();    // refaz a requisição ao pressionar o botão
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
