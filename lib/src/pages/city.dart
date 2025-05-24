import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customdrawer.dart';

class CityPage extends StatefulWidget {   // transformando o widget em um 'StateFulWidget'
  @override
  _CityPage createState() => _CityPage();
}

class _CityPage extends State<CityPage> {
  bool heart = false;   // boolean do coração

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',    
  );

  void backButtonAction(BuildContext pageContext) {
    Navigator.pop(pageContext);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cityData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;       // variável 'cityData' reçebe os 'arguments'

    final double  statusBarHeight = MediaQuery.of(context).padding.top;     // praticamente é a alturar do appbar
    final double footerHeight = MediaQuery.of(context).padding.bottom;

  var starRate = double.parse(cityData['review']).floor();      // arrendondando a média 'starRate' pra baixo
    var stars = [];   // array 'stars'
    for( var i = 0; i < 5; i++) {   // fazendo loop para preencher o array stars cinco vezes, true ou false
      if(i < starRate) {    // verificando média
        stars.add( true );
      } else {
        stars.add( false );
      }
    }

    return Consumer<AppData>(
      builder: (ctx, appdata, child) {

        heart = appdata.hasFavorite(cityData['name']);

        return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          pageContext: context
        ),

        backgroundColor: Colors.white,
        body:  Stack(
            children: <Widget>[

                Positioned(   // utilizando 'Positioned' para pocionar a imagem
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 250,
                  child: Image.network(
                    cityData['places'][0]['img'],   // pegando a imagem de 'cityData'
                    fit: BoxFit.cover,    // cobre a área disponível do container
                  ),
                ),

                ListView(
                  physics: ClampingScrollPhysics(),    // define o 'limite' do scroll
                  padding: EdgeInsets.zero,     // remove o 'padding'
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.only(top:220),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),

                      child: Column(
                        children: <Widget>[

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Container(
                                margin: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    
                                    Container(
                                      margin: EdgeInsets.only(bottom:5),
                                      child: Text(cityData['name'], style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold
                                      )),
                                    ),
                                    
                                    Row(
                                      children: <Widget>[

                                        Icon(Icons.star, color: stars[0] ? Colors.blue : Colors.grey, size: 16),     // icone de estrela
                                        Icon(Icons.star, color: stars[1] ? Colors.blue : Colors.grey, size: 16),       // com cor e tamanho definido
                                        Icon(Icons.star, color: stars[2] ? Colors.blue : Colors.grey, size: 16),          // verificandos se 'stars' for 'true' a cor será blue se for 'false' será grey
                                        Icon(Icons.star, color: stars[3] ? Colors.blue : Colors.grey, size: 16),
                                        Icon(Icons.star, color: stars[4] ? Colors.blue : Colors.grey, size: 16),

                                        Container(
                                          margin: EdgeInsets.only(left:5),
                                           child: Text(cityData['review'], style: TextStyle(   // 'cityData['review']' exibe a nota real das cidades
                                            fontFamily: 'Helvetica Neue',
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue
                                          )),
                                        )

                                      ],
                                    )

                                  ],
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.all(10),
                                child: IconButton(
                                  icon: Icon(heart ? Icons.favorite : Icons.favorite_border, color: Colors.red),    // icone de coração
                                  onPressed: () {

                                    setState(() {   // ao clicar no coração será dado um 'setState' no coração, que o removerá o adiçionará ao favorite
                                      appdata.favorite(cityData['name']);
                                    }); 

                                  },
                                ),
                              )

                            ],
                          ),

                          Container(
                            margin: EdgeInsets.only(
                              top: 0,
                              left: 15,
                              right: 15,
                              bottom: 10
                            ),
                            child: Text(cityData['description'], style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            )),
                          ),

                          Divider(
                            thickness: 1,
                          ),

                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text('PRINCIPAIS PONTOS TURÍSTICOS', style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            )),
                          ),

                          GridView.count(   // 'gridview' mostra os pontos turisticos
                            padding: EdgeInsets.only(bottom: footerHeight),
                            shrinkWrap: true,   // 'shrinkWrap' renderiza os quadrados dentro do gridview
                            physics: NeverScrollableScrollPhysics(),    // função 'NeverScrollableScrollPhysics' desabilita o scroll
                            crossAxisCount: 2,    // 'crossAxisCount' define dois itens por linha
                            childAspectRatio: 10 / 11,
                            children: List.generate(cityData['places']. length, (index) {   // 'children' será um 'array gerado'

                              return Container(
                                child: Column(
                                  children: <Widget>[

                                    Expanded(   // Expanded diminui os itens do container de acordo com o texto e área disponível
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),    // arredondando a borda
                                          child: Image.network(
                                            cityData['places'] [index]['img'],     // pega a imagem de cityData
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(top:5),
                                      child: Text(
                                        cityData['places'][index]['name'],   // pega o nome do local
                                        style: TextStyle(
                                          fontFamily: 'Helvetica Neue',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(top:10, bottom:15),
                                      child: Text('Ponto Turístico', style: TextStyle(
                                          fontFamily: 'Helvetica Neue',
                                          fontSize: 12,
                                          color: Colors.grey
                                      )),
                                    )

                                    
                                  ],
                                ),
                              );

                            }) 
                          )

                        ],
                      ),
                    )
                  ],
                ),

                
                Container(
                    height: 50,
                    margin: EdgeInsets.only(top: statusBarHeight),                    
                    child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          backButtonAction(context);
                        },
                    ),
                ),

            ],
        ),
      );
      }
    );
  }
}
