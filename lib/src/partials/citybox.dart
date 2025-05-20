import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {     // criando CityBox
    CityBox({ required this.data, this.onTap });        // CityBox com os parâmetros 'data' e 'onTap'

    final dynamic data;     // variáveis 'data' e 'onTap'
    final VoidCallback? onTap;

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.only(left:10, right:10),
            child: GestureDetector(     // widget 'GestureDetector' é um botão invisivél que permite inserir o que quiser
                onTap: onTap,
                child: Stack(       // utilizando 'Stack' para deixar um item em cima do outro
                    children: <Widget>[

                        AspectRatio(
                            aspectRatio: 1/1,       // define a área especifica do 'Stack' inteiro, 1/1 indica o que tiver de largura terá de altura
                            child: Container(                               
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),        // arredonda a borda
                                    color: Colors.grey
                                ),
                            ),
                        ),

                        Positioned(     // 'Positioned' permite definir todas as posições espeçificas
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: ClipRRect(       // widget 'ClipRRect' permite o arredondamento da imagem
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    data['places'][0]['img'],       // pegando a imagem de 'data' api
                                    fit: BoxFit.cover       // cobre toda área disponível
                                ),
                            ),
                        ),

                        Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors:[ Colors.transparent, Colors.black]
                                    )
                                ),
                            ),
                        ),

                        Positioned(
                            left: 0,
                            right: 0,
                            bottom: 10,
                            child: Text(
                                data['name'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:Colors.white,
                                    fontSize: 14
                                ),
                            ),
                        )

                    ],
                ),
            )
        );
    }
}