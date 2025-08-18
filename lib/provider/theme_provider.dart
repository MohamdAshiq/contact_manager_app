import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
