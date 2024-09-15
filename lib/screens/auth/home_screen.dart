
import 'package:alquilafacil/theme/main_theme.dart';
import 'package:alquilafacil/widgets/navigation_button.dart';
import 'package:alquilafacil/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MainTheme.primary,
      bottomNavigationBar: const BottomAppBar(
          child: ScreenBottomAppBar()
      ),
      body:  Center(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                 const Text(
                   "INICIA SESIÓN",
                   style: TextStyle(
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold
                   )
                 ),
                const SizedBox(height: 20),
                Container(
                  width: 330,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: MainTheme.background,
                   borderRadius: const BorderRadius.all(Radius.circular(10.0))
                  ),
                  child: TextField(
                    cursorColor: MainTheme.primary,
                    style: TextStyle(
                      color: MainTheme.primary
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: MainTheme.transparent
                        )
                      ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:MainTheme.primary),
                        ),
                      labelStyle: TextStyle(
                        color: MainTheme.helper
                      ),
                      label: const Text("Correo electrónico"),
                      hintText:  "Ingrese su correo electronico",
                      hintStyle: TextStyle(
                        color: MainTheme.helper
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 330,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: MainTheme.background,
                      borderRadius: const BorderRadius.all(Radius.circular(10.0))
                  ),
                  child: TextField(
                    cursorColor: MainTheme.primary,
                    style: TextStyle(
                        color: MainTheme.primary
                    ),
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MainTheme.transparent
                            )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:MainTheme.primary),
                        ),
                        labelStyle: TextStyle(
                            color: MainTheme.helper
                        ),
                        label: const Text("Contraseña"),
                        hintText:  "Ingrese su contraseña",
                        hintStyle: TextStyle(
                            color: MainTheme.helper
                        )
                    ),
                  ),
                )
              ],
            ),
          )
        ),
    );
  }

}