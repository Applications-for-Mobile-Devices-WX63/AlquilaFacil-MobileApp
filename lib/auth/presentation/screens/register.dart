import 'package:alquilafacil/auth/presentation/providers/ConditionTermsProvider.dart';
import 'package:alquilafacil/auth/presentation/providers/SignUpProvider.dart';
import 'package:alquilafacil/profile/presentation/providers/pofile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../../../public/ui/theme/main_theme.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/condition_terms.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    final signUpProvider = context.watch<SignUpProvider>();
    final profileProvider = context.watch<ProfileProvider>();
    final conditionTermsProvider = context.watch<ConditionTermsProvider>();
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
                        Navigator.pushReplacementNamed(context, route);
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
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 10),
            child: SingleChildScrollView(
              child: Center(
              child: Column(
                children: <Widget>[
                  const Text(
                    "REGÍSTRATE",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    textLabel: "Nombre de usuario",
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
                    textLabel: "Nombre",
                    textHint: "Ingrese su nombre",
                    isPassword: false,
                    param: profileProvider.name,
                    onChanged: (newValue) {
                      profileProvider.setName(newValue);
                    },
                    validator: (_) {
                      return profileProvider.validateName();
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: AuthTextField(
                          textLabel: "Apellido paterno",
                          textHint: "Ingrese su apellido paterno:",
                          isPassword: false,
                          param: profileProvider.fatherName,
                          onChanged: (newValue) {
                            profileProvider.setFatherName(newValue);
                          },
                          validator: (_) {
                            return profileProvider.validateName();
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: AuthTextField(
                          textLabel: "Apellido materno",
                          textHint: "Ingrese su apellido materno:",
                          isPassword: false,
                          param: profileProvider.motherName,
                          onChanged: (newValue) {
                            profileProvider.setMotherName(newValue);
                          },
                          validator: (_) {
                            return profileProvider.validateName();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: AuthTextField(
                          textLabel: "Número de telefono",
                          textHint: "Ingrese su número de telefono",
                          isPassword: false,
                          param: profileProvider.phoneNumber,
                          onChanged: (newValue) {
                            profileProvider.setPhoneNumber(newValue);
                          },
                          validator: (_) {
                            return profileProvider.validatePhoneNumber();
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: AuthTextField(
                          textLabel: "Número de documento",
                          textHint: "Ingrese su número de documento",
                          isPassword: false,
                          param: profileProvider.documentNumber,
                          onChanged: (newValue) {
                            profileProvider.setDocumentNumber(newValue);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    textLabel: "Fecha de nacimiento",
                    textHint: "DD/MM/YY",
                    isPassword: false,
                    param: profileProvider.dateOfBirth,
                    onChanged: (newValue) {
                      profileProvider.setDateOfBirth(newValue);
                    },
                    validator: (_) {
                      return profileProvider.validateDateOfBirth();
                    }
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
                      return signUpProvider.validateEmail();
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget> [
                      Expanded(
                        flex: 1,
                        child: AuthTextField(
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
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: AuthTextField(
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
                      ),
                    ]
                  ),
                  const SizedBox(height: 10),
                  const ConditionsTerms(),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: 330,
                      height: 50,
                      child: TextButton(
                        onPressed: () async {
                          try {
                            if (!conditionTermsProvider.isChecked) {
                              await _showDialog("Por favor, acepte nuestras políticas de uso", "/sign-up");
                            } else {
                                await signUpProvider.signUp();
                                if (signUpProvider.successFulMessage.isNotEmpty) {
                                  await profileProvider.createProfile(
                                    signUpProvider.email,
                                    signUpProvider.password,
                                  );
                                  await _showDialog("Registro exitoso", "/login");
                                } else{
                                  await _showDialog("Usuario ya existente o datos incorrectos", "/sign-up");
                                }
                            }
                          } catch (e) {
                            Logger().e("Error during registration: $e");
                            await _showDialog("Ocurrió un error en el registro", "/sign-up");
                          }
                        },
                        child: const Text("Regístrate ahora"),
                      )),
                  const SizedBox(height: 25),
                  const Text(
                      "¿Ya tienes cuenta?",
                      style: TextStyle(
                          fontSize: 10.0
                      )
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 330,
                    height: 50,
                    child: TextButton(
                      onPressed: ()=>{ Navigator.pushReplacementNamed(context, "/login")},
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
                        "o regístrate con",
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
                            onPressed: () async {
                              try{
                                if (!conditionTermsProvider.isChecked) {
                                  await _showDialog("Por favor, acepte nuestras políticas de uso", "/sign-up");
                                }else{
                                  final googleUserCredentials = await signUpProvider.signInWithGoogle();
                                  final nameDetails = googleUserCredentials.user?.displayName?.split(" ");
                                  profileProvider.setPhoneNumber(googleUserCredentials.user?.phoneNumber ?? "");
                                  profileProvider.setName(nameDetails?[0] ?? " ");
                                  profileProvider.setFatherName(nameDetails?[1] ?? " ");
                                  profileProvider.setMotherName(
                                      (nameDetails!.length >= 3) ? nameDetails[2] : " "
                                  );
                                  signUpProvider.setUsername(googleUserCredentials.user?.displayName ?? " ");
                                  signUpProvider.setEmail(googleUserCredentials.user?.email ?? "");
                                  Navigator.pushReplacementNamed(context, "/sign-up");
                                }
                              } on  FirebaseAuthException catch (_){
                                await _showDialog("Usuario ya existente o datos incorrectos", "/sign-up");
                              }
                            },
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
