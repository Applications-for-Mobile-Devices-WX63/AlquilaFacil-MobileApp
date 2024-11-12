import 'package:flutter/material.dart';

class MainTheme{
  static Color primary = const Color(0xFFD13333);
  static Color background = Colors.white;
  static Color transparent = Colors.transparent;
  static Color helper = Colors.grey;
  static Color secondary = Colors.orangeAccent;
  static Color contrast = Colors.black;
  static ThemeData lightTheme = ThemeData.light().copyWith(
    bottomAppBarTheme: BottomAppBarTheme(
      color: primary
    ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: background,
          fontWeight: FontWeight.bold
        )
      ),
    textButtonTheme:  TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: background,
        backgroundColor: secondary,
        shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)
           )
        )
      )
    )
  );
}