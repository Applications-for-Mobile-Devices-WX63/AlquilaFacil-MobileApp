import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:alquilafacil/auth/presentation/providers/SignUpProvider.dart';
import 'package:alquilafacil/contact/presentation/screens/notifications_screen.dart';
import 'package:alquilafacil/profile/presentation/screens/calendar_screen.dart';
import 'package:alquilafacil/profile/presentation/screens/profile_screen.dart';
import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:alquilafacil/reservation/presentation/screens/reservation_screen.dart';
import 'package:alquilafacil/spaces/presentation/screens/filter_screen.dart';
import 'package:alquilafacil/spaces/presentation/screens/filter_spaces.dart';
import 'package:alquilafacil/spaces/presentation/screens/register_space_steps.dart';
import 'package:alquilafacil/spaces/presentation/screens/search_spaces.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'auth/presentation/screens/login.dart';
import 'auth/presentation/screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es_ES');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider())
      ],
      child: MaterialApp(
        theme: MainTheme.lightTheme,
        initialRoute: "/login",
        routes: {
          "/login": (context) => const Login(),
          "/sign-up": (context) => const Register(),
          "/search-space": (context) => const SearchSpaces(),
          "/tutorial-space": (context) => const RegisterSpaceSteps(),
          "/filter-spaces": (context) => const FilterSpaces(),
          "/filter-screen": (context) => const FilterScreen(),
          "/notifications": (context) => const NotificationsScreen(),
          "/calendar": (context) => const CalendarScreen(),
          "/profile": (context) => const ProfileScreen(),
          "/detail-space": (context) => const ReservationScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
