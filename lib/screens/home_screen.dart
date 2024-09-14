
import 'package:alquilafacil/theme/main_theme.dart';
import 'package:alquilafacil/widgets/navigation_button.dart';
import 'package:alquilafacil/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: ScreenBottomAppBar()
      ),
    );
  }

}