
import 'package:flutter/material.dart';

import '../../theme/main_theme.dart';
import 'navigation_button.dart';

class ScreenBottomAppBar extends StatelessWidget{
  const ScreenBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget> [
        Expanded(child:   NavigationButton(buttonIcon: Icons.search_outlined, onNavigate: ()=>{}, iconColor: MainTheme.background, backgroundColor: Colors.orangeAccent),),
        Expanded(child:   NavigationButton(buttonIcon: Icons.notifications, onNavigate: ()=>{},iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background),),
        Expanded(child:  NavigationButton(buttonIcon: Icons.add, onNavigate:()=>{},iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background,)),
        Expanded(child:  NavigationButton(buttonIcon: Icons.calendar_month_outlined, onNavigate: ()=>{}, iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background)),
        Expanded(child: NavigationButton(buttonIcon: Icons.person_outline, onNavigate: ()=>{},iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background))
      ],
    );
  }

}