import 'dart:ui';
import 'package:alquilafacil/auth/presentation/providers/SignUpProvider.dart';
import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../public/ui/theme/main_theme.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/condition_terms.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    final signUpProvider = context.watch<SignUpProvider>();
    Future<void> _showDialog(String dialogTitle, String route) async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              dialogTitle,
              style: TextStyle(
                  color: MainTheme.contrast,
                  fontSize: 15.0
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: TextButton(
                      child: const Text('Confirmar'),
                      onPressed: () {
                        Navigator.pushNamed(context, route);
                      },
                    ),
                  ),
                  TextButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          );
        },

      );
    }
    return Scaffold(
        backgroundColor: MainTheme.primary,
        body: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: SingleChildScrollView(
                child: Center(
              child: Column(
                children: <Widget>[
                  const Text(
                    "REGISTRATE",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    textLabel: "Nombre de Usuario",
                    textHint: "Ingrese su nombre de usuario",
                    isPassword: false,
                    param: signUpProvider.username,
                    onChanged: (newValue) {
                      signUpProvider.setUsername(newValue);
                    },
                    validator: (_) {
                      return signUpProvider.validateUsername();
                    },
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    textLabel: "Correo electrónico",
                    textHint: "Ingrese su correo electrónico",
                    isPassword: false,
                    param: signUpProvider.email,
                    onChanged: (newValue) {
                      signUpProvider.setEmail(newValue);
                    },
                    validator: (_) {
                      return signUpProvider.validateUsername();
                    },
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    textLabel: "Contraseña",
                    textHint: "Ingrese su contraseña",
                    isPassword: true,
                    param: signUpProvider.password,
                    onChanged: (newValue) {
                      signUpProvider.setPassword(newValue);
                    },
                    validator: (_) {
                      return signUpProvider.validatePassword();
                    },
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    textLabel: "Escriba nuevamente su contraseña",
                    textHint: "Escriba nuevamente su contraseña",
                    isPassword: true,
                    param: signUpProvider.confirmPassword,
                    onChanged: (newValue) {
                      signUpProvider.setConfirmPassword(newValue);
                    },
                    validator: (_) {
                      return signUpProvider.validateConfirmPassword();
                    },
                  ),
                  const SizedBox(height: 10),
                  const ConditionsTerms(),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: 330,
                      height: 50,
                      child: TextButton(
                          onPressed: () async {
                            await signUpProvider.signUp();
                            if(signUpProvider.successFulMessage.isNotEmpty){
                              await _showDialog("Registro Exitoso", "/login");
                            } else {
                              await _showDialog("Usuario ya existente o datos incorrectos", "/sign-up");
                            }
                          },
                          child: const Text("Registrate ahora"))),
                  const SizedBox(height: 10),
                  const Text(
                      "¿Ya tienes cuenta? Inicia sesión",
                      style: TextStyle(
                          fontSize: 10.0
                      )
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 330,
                    height: 50,
                    child: TextButton(
                      onPressed: ()=>{ Navigator.pushNamed(context, "/login")},
                      child: const Text("Inicia sesión"),
                    )
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 330,
                    height: 1,
                    decoration: BoxDecoration(color: MainTheme.background),
                  ),
                  const SizedBox(height: 30.0),
                  Column(
                    children: <Widget>[
                      const Text(
                        "o registrate con",
                        style: TextStyle(fontSize: 10.0),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              onPressed: () => {},
                              icon: Image.network(
                                "https://logodownload.org/wp-content/uploads/2014/09/facebook-logo-1-2.png",
                                width: 40,
                              )),
                          const SizedBox(width: 20.0),
                          IconButton(
                            onPressed: () => {},
                            icon: Image.network(
                              "https://www.pngmart.com/files/16/official-Google-Logo-PNG-Image.png",
                              width: 30,
                            ),
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll<Color>(
                                    MainTheme.background)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ))));
  }
}
