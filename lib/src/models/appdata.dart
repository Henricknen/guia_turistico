import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;        // importando como 'http' para evitar confusão com a variável 'http'

import 'dart:convert';      // para usar o 'jsonDecode'

class AppData with ChangeNotifier {
  var data = [];        // array de informações
  var favorites = [];     // variável, array 'favorites' salvará os nomes das cidades marcadas como favoritas

  List favoritesCities() {    // função retorna a lista de cidade favoritas
    List result = [];

    for(var favorite in favorites) {    // percorrendo a lista de 'favorites' para pegar as cidades favoritas
      List foundCities = this.searchCity(favorite);
      if(foundCities.length > 0) {
        result.add( foundCities [0]);   // se encotrar alguma cidade favorita será 'armazenada' em result
      }
    }

    return result;
  }

  List searchCity(text) {   // função 'searchCity' retorna u list
    List result = [];

    text = text.trim().toLowerCase();   // trantando o texto digitado pelo usuário, utilizando 'trim' para remover 'espaços', e deixanto todo minúsculo
    if(text == '') {    // verificação de seguraça, se text estiver vazio
      return result;      // result que estará vazio será retornado
    }

    for(var continents in data) {
      for(var country in continents['countries']) {   // dando loop nos continetes pegando os países
        for(var city in country['cities']) {    // dando loop nos países pegando as cidades
          if(city['name'].toLowerCase().contains(text)) {
            result.add(city);   // adiçionando a cidade na lista 'result'
          }
        }
      }
    }

    return result;
  }

  bool hasFavorite(cityName) {    // função reçebe um nome de uma cidade e verifica se esse nome existe na lista de 'favorites'
    return favorites.contains(cityName);
  }

  bool favorite(cityName) {   // função 'remove' ou 'adiçiona' uma cidade de favorites
    if(this.hasFavorite(cityName)) {
      favorites.remove(cityName);   // remove
      return false;
    } else {
      favorites.add(cityName);    // adiçiona
      return true;
    }
  }

  void setData(newData) {       // 'setData' preenche as informações no array
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {        // função assíncrona pega os dados do webservice e seta dentro do data e retorna true
    final res = await http.get(Uri.parse('https://api.b7web.com.br/flutter1wb/'));      // requisição HTTP para a API

    if (res.statusCode == 200) {        // verifica o statusCode da resposta 'res'
      var decodedData = jsonDecode(res.body);       // decodificando o JSON da resposta
      setData(decodedData);     // definindo os dados no array 'data'
      return true;
    } else {
      return false;     // retorna 'false' caso a requisição não tenha sido bem-sucedida
    }
  }
}
