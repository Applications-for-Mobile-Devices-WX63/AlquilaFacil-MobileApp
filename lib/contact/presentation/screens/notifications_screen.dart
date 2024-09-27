import 'package:alquilafacil/contact/presentation/widgets/notification_preview.dart';
import 'package:alquilafacil/public/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notificaciones')),
      body: const Column(
        children: [
          NotificationPreview(
            title: 'Augusto quiere reservar tu espacio',
            message: 'Augusto Pin ha mostrado interés en alquilar tu espacio',
          ),
          NotificationPreview(
            title: 'Nueva notificación',
            message: 'Tienes una nueva notificación',
          ),
          NotificationPreview(
            title: 'Nueva notificación',
            message: 'Tienes una nueva notificación',
          ),
        ],
      ),
      bottomNavigationBar: const ScreenBottomAppBar(),
    );
  }
}
