import 'dart:ui';

import 'package:alquilafacil/auth/widgets/auth_text_field.dart';
import 'package:alquilafacil/auth/widgets/condition_terms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/main_theme.dart';

class Register extends StatefulWidget{
  const Register({super.key});

  @override
  State<StatefulWidget> createState() => _Register();
  
}


class _Register extends State<Register>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: MainTheme.primary,
       body:  Padding(
         padding: const EdgeInsets.only(top: 100.0),
         child:  SingleChildScrollView(
           child: Center(
             child: Column(
               children: [
                  const Text(
                         "REGISTRATE",
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 30.0
                       ),
                     ),
                 const SizedBox(height: 30),
                 AuthTextField(textLabel: "Nombre", textHint: "Ingrese su nombre", isPassword: false),
                 const SizedBox(height: 10),
                 AuthTextField(textLabel: "Apellidos", textHint: "Ingrese sus apellidos", isPassword: false),
                 const SizedBox(height: 10),
                 AuthTextField(textLabel: "Correo electrónico", textHint: "Ingrese su correo electrónico", isPassword: false),
                 const SizedBox(height: 10),
                 AuthTextField(textLabel: "Contraseña", textHint: "Ingrese su contraseña", isPassword: true),
                 const SizedBox(height: 10),
                 AuthTextField(textLabel: "Escriba nuevamente su contraseña", textHint: "Escriba nuevamente su contraseña", isPassword: true),
                 const SizedBox(height: 10),
                 ConditionsTerms(),
                 const SizedBox(height: 10),
                 SizedBox(
                     width: 330,
                     height: 50,
                     child: TextButton(
                         onPressed: ()=>{},
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