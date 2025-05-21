import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {     // criando CityBox

    // Alterado: agora 'onTap' aceita uma função que recebe 'dynamic data' como parâmetro
    CityBox({ required this.data, this.onTap });

    final dynamic data;     // variável 'data' representa a cidade
    final void Function(dynamic)? onTap;

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.only(left:10, right:10),
            child: GestureDetector(     // widget 'GestureDetector' é um botão invisível que permite inserir o que quiser
                onTap: () {
                    onTap?.call(data);      // chama a função 'onTap' passada para o widget, se ela não for nula, enviando 'data' como argumento 'ex: informações da cidade'
                },

                child: Stack(       // utilizando 'Stack' para deixar um item em cima do outro
                    children: <Widget>[

                        AspectRatio(
                            aspectRatio: 1/1,       // define a área específica do 'Stack' inteiro, 1/1 indica que a altura será igual à largura
                            child: Container(                               
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),        // arredonda a borda
                                    color: Colors.grey
                                ),
                            ),
                        ),

                        Positioned(     // 'Positioned' permite definir todas as posições específicas
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: ClipRRect(       // widget 'ClipRRect' permite o arredondamento da imagem
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    data['places'][0]['img'],       // pegando a imagem de 'data' da API
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
                                data['name'],       // pegando o nome da cidade do JSON
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
