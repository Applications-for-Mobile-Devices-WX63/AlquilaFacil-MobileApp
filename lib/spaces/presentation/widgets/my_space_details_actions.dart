import 'package:alquilafacil/auth/presentation/screens/login.dart';
import 'package:alquilafacil/spaces/presentation/providers/space_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../public/ui/theme/main_theme.dart';

class MySpaceDetailsActions extends StatelessWidget {
  const MySpaceDetailsActions({super.key});

  @override
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();
    return !spaceProvider.isEditMode ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
               backgroundColor: MainTheme.secondary,
              foregroundColor: MainTheme.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            onPressed:(){
              spaceProvider.setIsEditMode();
            },
            child: const Text("Editar datos de mi espacio")
        ),
      ],
    ) :  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: MainTheme.secondary,
                foregroundColor: MainTheme.background,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            onPressed:() async {
             try{
               await spaceProvider.updateSpace();
             } finally{
               spaceProvider.setIsEditMode();
             }
            },
            child: const Text("Confirmar cambios")
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: MainTheme.primary,
                foregroundColor: MainTheme.background,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            onPressed:(){
              spaceProvider.setIsEditMode();
            },
            child: const Text("Descartar cambios")
        ),
      ],
    );
  }
}