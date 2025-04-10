import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  // Getter to check if it's in dark mode
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // Getter to access the themeMode
  ThemeMode get themeMode => _themeMode;

  // Toggle the theme between light and dark mode
  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Notify listeners when the theme changes
  }
}
