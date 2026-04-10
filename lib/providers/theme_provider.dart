
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  void changeTheme(ThemeMode newThemeMode){

    if(newThemeMode == themeMode){
      return;
    }
    themeMode = newThemeMode;
    notifyListeners();
  }
  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme(){
    if(themeMode == ThemeMode.dark){
      themeMode = ThemeMode.light;
    }else if(themeMode == ThemeMode.light){
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
