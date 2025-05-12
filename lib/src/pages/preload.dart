import 'package:flutter/material.dart';
import 'package:flutter/services.dart';    // importando o pacote 'services'

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPageState createState() => _PreloadPageState();        // método de criação do estado
}

class _PreloadPageState extends State<PreloadPage> {
  bool loading = true;

  @override
  void initState() {
    super.initState();    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);    // comando 'SystemChrome.setSystemUIOverlayStyle' permite alterar a cor da 'statusbar'
  }

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
                ),

                loading ? Container(    // criando condiçional se 'loading' for true aparcerá o Container com suas informações
                  margin: EdgeInsets.all(30),
                  child: Text('Carregando Informações...',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ) : Container(),    // se 'loading' for false aparecerá o Container vazio

                loading ? CircularProgressIndicator(    // widget que exibe um 'indicador de progresso circular'
                  strokeWidth: 3,   // é a grossura do indicador
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),   //a altera a cor do indicador de progresso
                ) : Container(),

                !loading ? Container(   // se Container for false apareçe o botão
                  margin: EdgeInsets.all(30),
                  child: ElevatedButton(
                    child: Text('Tentar novamente...'),
                    onPressed: () {
                      // ação do botão
                    },
                  ),
                ) : Container(),    // se Container for true o botão não aparecerá
            ],
        )
      ),
    );
  }
}
