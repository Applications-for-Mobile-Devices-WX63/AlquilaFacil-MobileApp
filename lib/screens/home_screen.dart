
import 'package:alquilafacil/theme/main_theme.dart';
import 'package:alquilafacil/widgets/navigation_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
             Expanded(child:   NavigationButton(buttonIcon: Icons.search_outlined, onNavigate: ()=>{}, iconColor: MainTheme.background, backgroundColor: Colors.orangeAccent),),
            Expanded(child:   NavigationButton(buttonIcon: Icons.notifications, onNavigate: ()=>{},iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background),),
             Expanded(child:  NavigationButton(buttonIcon: Icons.add, onNavigate:()=>{},iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background,)),
             Expanded(child:  NavigationButton(buttonIcon: Icons.calendar_month_outlined, onNavigate: ()=>{}, iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background)),
              Expanded(child: NavigationButton(buttonIcon: Icons.person_outline, onNavigate: ()=>{},iconColor: Colors.orangeAccent, backgroundColor: MainTheme.background))
            ],
          ),
      ),
    );
  }

}