import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget{
  final IconData buttonIcon;
  final VoidCallback onNavigate;
  final Color backgroundColor;
  final Color iconColor;
  const NavigationButton({super.key, required this.buttonIcon, required this.onNavigate, required this.backgroundColor, required this.iconColor });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration:  BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle
      ),
      child: IconButton(
        onPressed: onNavigate,
        icon: Icon(
          buttonIcon,
          color: iconColor,
        ),

      )
    );
  }

}