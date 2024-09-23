import 'dart:ui';

import 'package:alquilafacil/public/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/spaces/widgets/search_space_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../public/ui/theme/main_theme.dart';


class FilterSpaces extends StatelessWidget {
  const FilterSpaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  MainTheme.background,
        title: const Center(
          child: Text(
            "Realizar búsqueda",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20
            ),
          ),
        ),
      ),
      backgroundColor:  MainTheme.background,
      bottomNavigationBar: const BottomAppBar(
        child: ScreenBottomAppBar(),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              SearchSpaceButton(suffixIcon: Icons.close,)
            ],
          ),
        ),
      ),
    );
  }
  
}

