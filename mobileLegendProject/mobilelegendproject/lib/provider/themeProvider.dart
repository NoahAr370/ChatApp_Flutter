import 'package:flutter/material.dart';
import 'package:mobilelegendproject/provider/theme.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  bool _isDark = false;

  ThemeData get themeMode => _themeData;
  bool get isDark => _isDark;

  get nn => null;
  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
  }

  void lightmode() {
    _themeData = lightMode;
    _isDark = false;
    notifyListeners();
  }

  void nightmode() {
    _themeData = darkMode;
    _isDark = true;
    notifyListeners();
  }
}
