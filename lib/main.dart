
import 'package:alquilafacil/theme/main_theme.dart';
import 'package:flutter/material.dart';

import 'auth/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MainTheme.lightTheme ,
      home: const Login(),
      debugShowCheckedModeBanner: false,
    );
  }

}

