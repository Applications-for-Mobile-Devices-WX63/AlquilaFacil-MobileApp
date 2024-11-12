import 'package:flutter/material.dart';
import '../theme/main_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = MainTheme.lightTheme;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    if (_currentTheme == MainTheme.lightTheme) {
      _currentTheme = MainTheme.darkTheme;
    } else {
      _currentTheme = MainTheme.lightTheme;
    }
    notifyListeners();
  }
}