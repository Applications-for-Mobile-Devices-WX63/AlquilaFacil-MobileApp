
import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:alquilafacil/spaces/screens/filter_screen.dart';
import 'package:alquilafacil/spaces/screens/filter_spaces.dart';
import 'package:alquilafacil/spaces/screens/register_space_steps.dart';
import 'package:alquilafacil/spaces/screens/search_spaces.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/presentation/screens/login.dart';
import 'auth/presentation/screens/register.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider())
      ],
      child: MaterialApp(
        theme: MainTheme.lightTheme ,
        initialRoute: "/",
        routes:{
          "/":(context) => const Login(),
          "/sign-up":(context) => const Register(),
          "/search-space":(context) => const SearchSpaces(),
          "/tutorial-space":(context) => const RegisterSpaceSteps(),
          "/filter-spaces":(context) => const FilterSpaces(),
          "/filter-screen":(context) => const FilterScreen()
      
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}

