import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:alquilafacil/public/presentation/widgets/navigation_button.dart';

class ScreenBottomAppBar extends StatelessWidget {
  const ScreenBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '';
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: NavigationButton(
            buttonIcon: Icons.search_outlined,
            onNavigate: () =>
                Navigator.pushReplacementNamed(context, '/search'),
            iconColor: currentRoute == '/search'
                ? MainTheme.background
                : Colors.orangeAccent,
            backgroundColor: currentRoute == '/search'
                ? Colors.orangeAccent
                : MainTheme.background,
          )),
          Expanded(
              child: NavigationButton(
            buttonIcon: Icons.notifications,
            onNavigate: () =>
                Navigator.pushReplacementNamed(context, '/notifications'),
            iconColor: currentRoute == '/notifications'
                ? MainTheme.background
                : Colors.orangeAccent,
            backgroundColor: currentRoute == '/notifications'
                ? Colors.orangeAccent
                : MainTheme.background,
          )),
          Expanded(
              child: NavigationButton(
            buttonIcon: Icons.add,
            onNavigate: () => Navigator.pushReplacementNamed(context, '/add'),
            iconColor: currentRoute == '/add'
                ? MainTheme.background
                : Colors.orangeAccent,
            backgroundColor: currentRoute == '/add'
                ? Colors.orangeAccent
                : MainTheme.background,
            size: 60.0,
          )),
          Expanded(
              child: NavigationButton(
            buttonIcon: Icons.calendar_month_outlined,
            onNavigate: () =>
                Navigator.pushReplacementNamed(context, '/calendar'),
            iconColor: currentRoute == '/calendar'
                ? MainTheme.background
                : Colors.orangeAccent,
            backgroundColor: currentRoute == '/calendar'
                ? Colors.orangeAccent
                : MainTheme.background,
          )),
          Expanded(
              child: NavigationButton(
            buttonIcon: Icons.person_outline,
            onNavigate: () =>
                Navigator.pushReplacementNamed(context, '/profile'),
            iconColor: currentRoute == '/profile'
                ? MainTheme.background
                : Colors.orangeAccent,
            backgroundColor: currentRoute == '/profile'
                ? Colors.orangeAccent
                : MainTheme.background,
          )),
        ],
      ),
    );
  }
}
