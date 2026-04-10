import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/ui/screens/add_event_screen.dart';
import 'package:evently_app/ui/screens/edit_event_screen.dart';
import 'package:evently_app/ui/screens/event_details_screen.dart';
import 'package:evently_app/ui/screens/forget_password_screen.dart';
import 'package:evently_app/ui/screens/intro_screen.dart';
import 'package:evently_app/ui/screens/login_screen.dart';
import 'package:evently_app/ui/screens/main_screen.dart';
import 'package:evently_app/ui/screens/on_boarding_screen.dart';
import 'package:evently_app/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'core/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseFirestore.instance.disableNetwork();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => UserProvider(),
          ),
        ],
        child: EventlyApp(),
      ),
    ),
  );
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: AppRoutes.introScreen,
      routes: {
        AppRoutes.loginScreen: (context) => LoginScreen(),
        AppRoutes.registerScreen: (context) => RegisterScreen(),
        AppRoutes.mainScreen: (context) => MainScreen(),
        AppRoutes.onBoardingScreen: (context) => OnBoardingScreen(),
        AppRoutes.introScreen: (context) => IntroScreen(),
        AppRoutes.forgetPasswordScreen: (context) => ForgetPasswordScreen(),
        AppRoutes.addEventScreen: (context) => AddEventScreen(),
        AppRoutes.eventDetailsScreen: (context) => EventDetailsScreen(),
        AppRoutes.editEventScreen: (context) => EditEventScreen(),
      },
    );
  }
}
