
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String languageCode = 'en';
  void changeLanguage(String newLanguageCode){

    // context.setLocale(Locale(newLanguageCode));
    if(newLanguageCode == languageCode){
      return;
    }
    languageCode = newLanguageCode;
    notifyListeners();
  }
  bool get isEnglish => languageCode == 'en';
  void toggleLanguage(){
    if(languageCode == 'en'){
      languageCode = 'ar';
    }else if(languageCode == 'ar'){
      languageCode = 'en';
    }
    notifyListeners();
  }
}