import 'package:alquilafacil/auth/data/remote/helpers/auth_service_helper.dart';
import 'package:alquilafacil/auth/presentation/providers/ConditionTermsProvider.dart';
import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:alquilafacil/auth/presentation/providers/SignUpProvider.dart';
import 'package:alquilafacil/contact/presentation/screens/notifications_screen.dart';
import 'package:alquilafacil/notification/data/remote/helpers/notification_service_helper.dart';
import 'package:alquilafacil/notification/presentation/providers/notification_provider.dart';
import 'package:alquilafacil/profile/data/remote/helpers/user_service_helper.dart';
import 'package:alquilafacil/profile/presentation/providers/pofile_provider.dart';
import 'package:alquilafacil/profile/presentation/screens/calendar_screen.dart';
import 'package:alquilafacil/profile/presentation/screens/profile_details.dart';
import 'package:alquilafacil/profile/presentation/screens/profile_screen.dart';
import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:alquilafacil/reservation/data/remote/helpers/reservation_service_helper.dart';
import 'package:alquilafacil/reservation/presentation/providers/reservation_provider.dart';
import 'package:alquilafacil/spaces/data/remote/helpers/comment_service_helper.dart';
import 'package:alquilafacil/spaces/data/remote/helpers/local_categories_service_helper.dart';
import 'package:alquilafacil/spaces/data/remote/helpers/space_service_helper.dart';
import 'package:alquilafacil/spaces/presentation/providers/comment_provider.dart';
import 'package:alquilafacil/spaces/presentation/providers/local_categories_provider.dart';
import 'package:alquilafacil/spaces/presentation/providers/space_provider.dart';
import 'package:alquilafacil/spaces/presentation/screens/comments_screen.dart';
import 'package:alquilafacil/spaces/presentation/screens/filter_screen.dart';
import 'package:alquilafacil/spaces/presentation/screens/register_space_steps_screen.dart';
import 'package:alquilafacil/reservation/presentation/screens/space_info.dart';
import 'package:alquilafacil/spaces/presentation/screens/spaces_details.dart';
import 'package:alquilafacil/spaces/presentation/screens/filter_spaces_district.dart';
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
    final authServiceHelper = AuthServiceHelper();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider(authServiceHelper)),
        ChangeNotifierProvider(create: (_) => SignUpProvider(authServiceHelper)),
        ChangeNotifierProvider(create: (_) => ConditionTermsProvider()),

        ChangeNotifierProxyProvider<SignInProvider, NotificationProvider>(
            create: (_) => NotificationProvider(NotificationServiceHelper(SignInProvider(authServiceHelper))),
             update: (context, sigInProvider, previousNotificationProvider) =>
                 NotificationProvider(NotificationServiceHelper(sigInProvider)),
        ),
        ChangeNotifierProxyProvider<SignInProvider, SpaceProvider>(
          create: (_) => SpaceProvider(SpaceServiceHelper(SignInProvider(authServiceHelper))),
          update: (context, signInProvider, previousSpaceProvider) =>
              SpaceProvider(SpaceServiceHelper(signInProvider)),
        ),
        ChangeNotifierProxyProvider<SignInProvider, LocalCategoriesProvider>(
          create: (_) => LocalCategoriesProvider(LocalCategoriesServiceHelper(SignInProvider(authServiceHelper))),
          update: (context, signInProvider, previousLocalCategoryProvider) =>
              LocalCategoriesProvider(LocalCategoriesServiceHelper(signInProvider))
        ),
        ChangeNotifierProxyProvider<SignInProvider,ProfileProvider>(
          create: (_) => ProfileProvider(UserServiceHelper(SignInProvider(authServiceHelper))),
          update: (context, signInProvider, previousProfileProvider) =>
              ProfileProvider(UserServiceHelper(signInProvider))
        ),
        ChangeNotifierProxyProvider<SignInProvider,ReservationProvider>(
          create: (_) => ReservationProvider(ReservationServiceHelper(SignInProvider(authServiceHelper))), 
          update: (context, signInProvider, previousReservationProvider) =>
              ReservationProvider(ReservationServiceHelper(signInProvider))
        ),
        ChangeNotifierProxyProvider<SignInProvider,CommentProvider>(
            create: (_) => CommentProvider(CommentServiceHelper(SignInProvider(authServiceHelper))),
            update: (context, signInProvider, previousCommentProvider) =>
                CommentProvider(CommentServiceHelper(signInProvider))
        ),
      ],
      child: MaterialApp(
        theme: MainTheme.lightTheme,
        initialRoute: "/login",
        routes: {
          "/login": (context) => const Login(),
          "/sign-up": (context) => const Register(),
          "/search-space": (context) => const SearchSpaces(),
          "/tutorial-space": (context) => const RegisterSpaceStepsScreen(),
          "/filter-spaces": (context) => const FilterSpacesDistrict(),
          "/spaces-details": (context) => const SpacesDetails(),
          "/filter-screen": (context) => const FilterScreen(),
          "/notifications": (context) => const NotificationsScreen(),
          "/calendar": (context) => const CalendarScreen(),
          "/profile": (context) => const ProfileScreen(),
          "/space-info": (context) => const SpaceInfo(),
          "/comments": (context) => const CommentsScreen(),
          "/profile-details": (context) => const ProfileDetails()
          //"/detail-space": (context) => const ReservationScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
