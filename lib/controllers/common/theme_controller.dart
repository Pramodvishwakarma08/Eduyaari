
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/themes/dark_theme.dart';
import '../../res/themes/light_theme.dart';


class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;


  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  Future<void> initializeThemeData() async {
    _darkTheme =  DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
   }

  ThemeData getDarkTheme(){
    return _darkTheme;
  }

  ThemeData getLightheme(){
    return _lightTheme;
  }


}
