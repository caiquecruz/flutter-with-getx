import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppThemes { lightTheme, darkTheme }

class GlobalController extends GetxController {
  final _themeMode = AppThemes.lightTheme.obs;

  AppThemes get themeMode => _themeMode.value;

  void switchThemeMode({required AppThemes appThemes}) {
    switch (appThemes) {
      case AppThemes.lightTheme:
        _themeMode.value = AppThemes.lightTheme;
        Get.changeTheme(ThemeData.light());
        break;
      case AppThemes.darkTheme:
        _themeMode.value = AppThemes.darkTheme;
        Get.changeTheme(ThemeData.dark());
        break;
    }
  }
}
