import 'package:flutter/material.dart';

class MainTheme{
  static Color primary = Colors.red;
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
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll<Color>(background),
        backgroundColor: WidgetStatePropertyAll<Color>(secondary),
        shape: const WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              )
        )
      )
    )
  );
}