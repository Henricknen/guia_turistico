import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
    var data = [];        // array de informações

    void setData(newData) {     // 'setData' preenche as informações no array
        data = newData;
        notifyListeners();
    }
}