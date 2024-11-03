import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:alquilafacil/auth/presentation/screens/login.dart';
import 'package:alquilafacil/contact/presentation/widgets/notification_preview.dart';
import 'package:alquilafacil/notification/presentation/providers/notification_provider.dart';
import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  @override
  void initState(){
    super.initState();
    final signInProvider = context.read<SignInProvider>();
    final notificationProvider = context.read<NotificationProvider>();
    () async{
      await notificationProvider.fetchNotificationsByUserId(signInProvider.userId);
    }();
  }
  @override
  Widget build(BuildContext context) {
    final notificationProvider = context.read<NotificationProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Notificaciones')),
      body: notificationProvider.notifications.isNotEmpty ? SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: notificationProvider.notifications.length,
            itemBuilder: (context, int index){
              return NotificationPreview(
                  title: notificationProvider.notifications[index].title,
                  message: notificationProvider.notifications[index].description
              );
            }
          )
      ) : const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "No tienes notificaciones",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      bottomNavigationBar: const ScreenBottomAppBar(),
    );
  }
}

