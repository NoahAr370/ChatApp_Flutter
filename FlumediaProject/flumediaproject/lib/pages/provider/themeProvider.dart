import 'package:flumediaproject/pages/provider/theme.dart';
import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeMode => _themeData;

  get nn => null;
  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
  }
}
