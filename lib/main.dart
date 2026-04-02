// import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/providers/language_provider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/ui/screens/intro_screen.dart';
import 'package:evently_app/ui/screens/login_screen.dart';
import 'package:evently_app/ui/screens/main_screen.dart';
import 'package:evently_app/ui/screens/on_boarding_screen.dart';
import 'package:evently_app/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_theme.dart';
import 'l10n/app_localizations.dart';

void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();

  runApp(

      MultiProvider(providers: [ChangeNotifierProvider(create: (BuildContext context) => LanguageProvider()),ChangeNotifierProvider(create: (BuildContext context) => ThemeProvider()),],child: EventlyApp())
    // EasyLocalization(
    //   supportedLocales: [Locale('en'), Locale('ar')],
    //   path: 'assets/translations',
    //   fallbackLocale: Locale('ar'),
    //   child: ChangeNotifierProvider(
    //     create: (_) => LanguageProvider(),
    //     child: EventlyApp(),
    //   ),
    // ),
  );
}

class EventlyApp extends StatelessWidget {
   const EventlyApp({super.key});


  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale:context.locale,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.languageCode),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: AppRoutes.introScreen,
      routes: {
        AppRoutes.loginScreen : (context)=>LoginScreen(),
        AppRoutes.registerScreen : (context)=>RegisterScreen(),
        AppRoutes.mainScreen : (context)=>MainScreen(),
        AppRoutes.onBoardingScreen : (context)=>OnBoardingScreen(),
        AppRoutes.introScreen : (context)=>IntroScreen(),
      },

    );
  }
}
