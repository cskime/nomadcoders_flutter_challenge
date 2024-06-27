import 'package:flutter/material.dart';

class ThemeModeService extends ChangeNotifier {
  var _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void switchThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
