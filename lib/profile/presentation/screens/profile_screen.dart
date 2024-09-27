import 'package:alquilafacil/public/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/navigation_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel de control')),
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
                routeName: '/search',
              ),
              Divider(),
              NavigationRow(
                title: 'Destacar espacios',
                routeName: '/notifications',
              ),
              Divider(),
              NavigationRow(
                title: 'Gestionar espacios',
                routeName: '/calendar',
              ),
              Divider(),
              NavigationRow(
                title: 'Cerrar sesión',
                routeName: '/add',
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: const ScreenBottomAppBar(),
    );
  }
}
