import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class CityPage extends StatelessWidget {

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

    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
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
                    fit: BoxFit.cover,
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
                            children: <Widget>[
                              Text(cityData['name'], style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 19,
                                fontWeight: FontWeight.bold
                              )),
                              Text('Estrelinhas'),

                              Column(
                                children: <Widget>[

                                ],
                              ),

                              Text('...')

                            ],
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
        )
      ),
    );
  }
}
