import 'package:contact_manager_app/services/theme_services.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider(this._isDark);
  bool _isDark;
  bool get isDark => _isDark;

  // Themes definiton with Poppins font family
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Poppins",
  );
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Poppins",
  );

  // Theme getter
  ThemeData get theme => isDark ? darkTheme : lightTheme;

  // Function for toggling Theme
  void toggleTheme() {
    _isDark = !_isDark;
    ThemeServices.setTheme(_isDark);
    notifyListeners();
  }
}
