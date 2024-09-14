import 'package:flutter/material.dart';

class MainTheme{
  static Color primary = Colors.red;
  static Color background = Colors.white;
  static Color transparent = Colors.transparent;
  static Color helper = Colors.grey;
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