
import 'package:alquilafacil/auth/widgets/auth_text_field.dart';
import 'package:alquilafacil/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../public/widgets/screen_bottom_app_bar.dart';

class Login extends StatefulWidget{
  const Login({super.key});
  @override
  State<StatefulWidget> createState() => _LoginState();


}

class _LoginState extends State<Login>{
  bool isAccepted = false;
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
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                    )
                ),
                const SizedBox(height: 10),
                const AuthTextField( textLabel: 'Correo electrónico', textHint: 'Ingrese Correo electrónico', isPassword: false,),
                const SizedBox(height: 10),
                const AuthTextField(textLabel: 'Contrasenña', textHint: 'Ingrese Contraseña', isPassword: true),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Checkbox(
                        value: isAccepted,
                        side: BorderSide(
                          color: MainTheme.secondary,
                          width: 2.0
                        ),
                        activeColor: MainTheme.transparent,
                        checkColor: MainTheme.secondary,
                        onChanged: (bool? value){
                      setState(() {
                        isAccepted = value ?? false;
                      });
                    }),
                    const SizedBox(width: 10.0),
                    const SizedBox(
                      width: 200,
                        child: Text("Al registrarse, acepta los Términos y uso y la Política de Privacidad de AlquilaFácil",
                        style: TextStyle(
                          fontSize: 10.0
                        ),)
                    )
                  ],
                ),

                const SizedBox(height: 10.0),
                SizedBox(
                  width: 330,
                  height: 50,
                  child: TextButton(
                    onPressed: () {  },
                    child: const Text("Iniciar Sesión"),
                  ),
                ),
                const SizedBox(height: 20.0),
                 Container(
                    width:330,
                    height:1,
                   decoration: BoxDecoration(
                     color: MainTheme.background
                   ),
                ),
                const SizedBox(height: 20.0),
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
      ),
    );
  }

}
