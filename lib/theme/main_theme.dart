import 'package:flutter/material.dart';

class MainTheme{
  static Color primary = Colors.red;
  static Color background = Colors.white;
  static ThemeData lightTheme = ThemeData.light().copyWith(
    bottomAppBarTheme: BottomAppBarTheme(
      color: primary
    ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: background,
          fontWeight: FontWeight.bold
        )
      )
  );
}