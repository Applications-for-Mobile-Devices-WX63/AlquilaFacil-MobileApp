import 'package:alquilafacil/auth/presentation/screens/register.dart';
import 'package:alquilafacil/profile/presentation/providers/pofile_provider.dart';
import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                elevation: 0,
                backgroundColor: MainTheme.secondary(context),
                foregroundColor: Colors.white
              ),
                onPressed: (){
                  profileProvider.setIsEditMode();
                },
                child: const Text(
                  "Editar datos de mi perfil",
                  style: TextStyle(
                      fontSize: 12
                  ),
                ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  elevation: 0,
                    backgroundColor: MainTheme.primary(context),
                    foregroundColor: Colors.white
                ),
                onPressed: (){

                },
                child: const Text(
                    "Cerrar sesión",
                  style: TextStyle(
                    fontSize: 12
                  ),
                )
            )
          ],
        ),
    );
  }
}
