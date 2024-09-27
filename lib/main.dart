import 'package:alquilafacil/auth/screens/register.dart';
import 'package:alquilafacil/theme/main_theme.dart';
import 'package:flutter/material.dart';

import 'auth/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MainTheme.lightTheme,
      initialRoute: "/",
      routes: {
        "/": (context) => const Login(),
        "/sign-up": (context) => const Register(),
        "/search-space": (context) => const SearchSpaces(),
        "/tutorial-space": (context) => const RegisterSpaceSteps(),
        "/filter-spaces": (context) => const FilterSpaces(),
        "/filter-screen": (context) => const FilterScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
