import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../public/ui/theme/main_theme.dart';
import '../widgets/navigation_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.background,
      appBar: AppBar(
          backgroundColor: MainTheme.background,
          title: const Text('Panel de control')
      ),
      body: const Center(
          child: Card(
        margin: EdgeInsets.all(16.0),
        elevation: 10.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NavigationRow(
                title: 'Modificar perfil',
                routeName: '/profile-details',
              ),
              Divider(),
              NavigationRow(
                title: 'Destacar espacios',
                routeName: '/notifications',
              ),
              Divider(),
              NavigationRow(
                title: 'Ver mis espacios',
                routeName: '/my-spaces',
              ),
              Divider(),
              NavigationRow(
                title: 'Cerrar sesión',
                routeName: '/login',
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: const ScreenBottomAppBar(),
    );
  }
}
