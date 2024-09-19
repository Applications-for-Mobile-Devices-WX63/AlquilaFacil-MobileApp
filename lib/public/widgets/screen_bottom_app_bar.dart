
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
        Expanded(child:   NavigationButton(buttonIcon: Icons.search_outlined, onNavigate: ()=>{Navigator.pushNamed(context, '/sign-up')}, iconColor: MainTheme.background, backgroundColor: Colors.orangeAccent),),
        Expanded(child:   NavigationButton(buttonIcon: Icons.notifications, onNavigate: ()=>{Navigator.pushNamed(context, '/')},iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background),),
        Expanded(child:  NavigationButton(buttonIcon: Icons.add, onNavigate:()=>{Navigator.pushNamed(context, '/tutorial-space')},iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background,)),
        Expanded(child:  NavigationButton(buttonIcon: Icons.calendar_month_outlined, onNavigate: ()=>{Navigator.pushNamed(context, '/')}, iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background)),
        Expanded(child: NavigationButton(buttonIcon: Icons.person_outline, onNavigate: ()=>{Navigator.pushNamed(context, '/')},iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background))
      ],
    );
  }

}