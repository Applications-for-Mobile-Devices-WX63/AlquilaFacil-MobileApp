import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../public/ui/theme/main_theme.dart';
import '../widgets/auth_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isAccepted = false;
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
  @override
  Widget build(BuildContext context) {
    final signInProvider = context.watch<SignInProvider>();
    return Scaffold(
      backgroundColor: MainTheme.primary,
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("INICIA SESIÓN",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            AuthTextField(
              textLabel: 'Correo electrónico',
              textHint: 'Ingrese Correo electrónico',
              isPassword: false,
              param: signInProvider.email,
              onChanged: (newEmail) {
                signInProvider.setEmail(newEmail);
              },
              validator: (_) {
                return signInProvider.validateEmail();
              },
            ),
            const SizedBox(height: 10),
            AuthTextField(
              textLabel: 'Contraseña',
              textHint: 'Ingrese Contraseña',
              isPassword: true,
              param: signInProvider.password,
              onChanged: (newPassword) {
                signInProvider.setPassword(newPassword);
              },
              validator: (_) {
                return signInProvider.validatePassword();
              },
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 330,
              height: 50,
              child: TextButton(
                onPressed: () async  {
                  await signInProvider.signIn();
                  if(signInProvider.token.isNotEmpty){
                    await _showDialog("Inicio de sesión exitoso","/search-space");
                  }
                  else {
                    await _showDialog("Correo electrónico o contraseña incorrectos","/login");
                  }
                },
                child: const Text("Iniciar Sesión"),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
                "¿Aun no tienes cuenta? Registrate",
              style: TextStyle(
                fontSize: 10.0
              )
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 330,
              height: 50,
              child: TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/sign-up");
                  },
                  child: const Text("Registrate")
              )
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 330,
              height: 1,
              decoration: BoxDecoration(color: MainTheme.background),
            ),
            const SizedBox(height: 20.0),
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
      )),
    );
  }
}
