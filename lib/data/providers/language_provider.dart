import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:vsp_logistics/res/localization/locale_type.dart';

class LanguageProvider extends ChangeNotifier{

  LanguageProvider(){
    refresh();
  }

  final languageBox = Hive.box('language_box');
  var list = [];

  void refresh()async{
    print("---------------------------------------------------here");
    print(languageBox.keys);
    print(languageBox.isEmpty);
    print(languageBox.isNotEmpty);
    print(languageBox.get(0));
    if(languageBox.keys.isNotEmpty){
      final data = languageBox.keys.map((key) {
        final item = languageBox.get(key);
        return {'key':key, 'language':item['language'],};
      }).toList();
      list = data;
    }else{
      print("here shit");
      var value = {
        'language':"English",
      };
      await languageBox.add(value);
      refresh();
    }
    notifyListeners();
  }

  void toggleLanguage(dynamic key, String value){
    languageBox.get(key)['language'] = value;
    languageBox.put(key, languageBox.get(key));
    refresh();
  }


}