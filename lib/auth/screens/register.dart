import 'dart:ui';
import 'package:alquilafacil/auth/widgets/auth_text_field.dart';
import 'package:alquilafacil/auth/widgets/condition_terms.dart';
import 'package:alquilafacil/public/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../theme/main_theme.dart';

class Register extends StatefulWidget{
  const Register({super.key});

  @override
  State<StatefulWidget> createState() => _Register();
  
}


class _Register extends State<Register>{
  String firstName = "";
  String lastName = "";
  String email = "";
  String phoneNumber = "";
  String documentNumber = "";
  String password = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: MainTheme.primary,
       bottomNavigationBar: const BottomAppBar(
         child: ScreenBottomAppBar(),
       ),
       body:  Padding(
         padding: const EdgeInsets.only(top: 100.0),
         child:  SingleChildScrollView(
           child: Center(
             child: Column(
               children: <Widget> [
                  const Text(
                         "REGISTRATE",
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 30.0
                       ),
                     ),
                 const SizedBox(height: 30),
                 AuthTextField(
                   textLabel: "Nombre",
                   textHint: "Ingrese su nombre",
                   isPassword: false,
                   param: firstName,
                   onChanged: (newValue) {
                     setState(() {
                       firstName = newValue;
                     });
                   },
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Por favor, ingrese su nombre';
                     }
                   },
                 ),
                 const SizedBox(height: 10),
                 AuthTextField(
                   textLabel: "Apellidos",
                   textHint: "Ingrese sus apellidos",
                   isPassword: false,
                   param: lastName,
                   onChanged: (newValue) {
                     setState(() {
                       lastName = newValue;
                     });
                   },
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Por favor, ingrese sus apellidos';
                     }
                   },
                 ),
                 const SizedBox(height: 10),
                 AuthTextField(
                   textLabel: "Correo electrónico",
                   textHint: "Ingrese su correo electrónico",
                   isPassword: false,
                   param: email,
                   onChanged: (newValue) {
                     setState(() {
                       email = newValue;
                     });
                   },
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Por favor, ingrese su correo electrónico';
                     }
                     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                       return 'Ingrese un correo electrónico válido';
                     }
                   },
                 ),
                 const SizedBox(height: 10),
                 AuthTextField(
                   textLabel: "Número de Teléfono",
                   textHint: "Ingrese su número de teléfono",
                   isPassword: false,
                   param: phoneNumber,
                   onChanged: (newValue) {
                     setState(() {
                       phoneNumber = newValue;
                     });
                   },
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Por favor, ingrese su número de teléfono';
                     }
                     if (value.length < 9) {
                       return 'El número de teléfono debe tener al menos 9 dígitos';
                     }
                   },
                 ),
                 const SizedBox(height: 10),
                 AuthTextField(
                   textLabel: "Número de documento",
                   textHint: "Ingrese su número de documento",
                   isPassword: false,
                   param: documentNumber,
                   onChanged: (newValue) {
                     setState(() {
                       documentNumber = newValue;
                     });
                   },
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Por favor, ingrese su número de documento';
                     }
                   },
                 ),
                 const SizedBox(height: 10),
                 AuthTextField(
                   textLabel: "Contraseña",
                   textHint: "Ingrese su contraseña",
                   isPassword: true,
                   param: password,
                   onChanged: (newValue) {
                     setState(() {
                       password = newValue;
                     });
                   },
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Por favor, ingrese una contraseña';
                     }
                     if (value.length < 8) {
                       return 'La contraseña debe tener al menos 8 caracteres';
                     }
                   },
                 ),
                 const SizedBox(height: 10),
                 AuthTextField(
                   textLabel: "Escriba nuevamente su contraseña",
                   textHint: "Escriba nuevamente su contraseña",
                   isPassword: true,
                   param: confirmPassword,
                   onChanged: (newValue) {
                     setState(() {
                       confirmPassword = newValue;
                     });
                   },
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Por favor, confirme su contraseña';
                     }
                     if (value != password) {
                       return 'Las contraseñas no coinciden';
                     }

                   },
                 ),
                 const SizedBox(height: 10),
                 const ConditionsTerms(),
                 const SizedBox(height: 10),
                 SizedBox(
                     width: 330,
                     height: 50,
                     child: TextButton(
                         onPressed: ()=>{
                         },
                         child: const Text("Registrate ahora")
                     )
                 ),
                 const SizedBox(height: 10),
             Container(
               width:330,
               height:1,
               decoration: BoxDecoration(
                   color: MainTheme.background
               ),
             ),
             const SizedBox(height: 30.0),
             Column(
               children: <Widget> [
                 const Text("o registrate con",
                   style: TextStyle(
                       fontSize: 10.0
                   ),
                 ),
                 const SizedBox(height: 20.0),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget> [
                     IconButton(
                         onPressed: ()=>{},
                         icon: Image.network("https://logodownload.org/wp-content/uploads/2014/09/facebook-logo-1-2.png",
                           width: 40,
                         )
                     ),
                     const SizedBox(width: 20.0),
                     IconButton(
                       onPressed: ()=>{},
                       icon: Image.network("https://www.pngmart.com/files/16/official-Google-Logo-PNG-Image.png",
                         width: 30,
                       ),
                       style: ButtonStyle(
                           backgroundColor: WidgetStatePropertyAll<Color>(MainTheme.background)
                       ),
                     )
                   ],
                 )
               ],
             )
           ],
         ),
       )
    )
             )
    );
  }
  
}