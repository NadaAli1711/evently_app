import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      headlineLarge: AppStyles.mainColor24SemiBold,
      headlineMedium: AppStyles.black20SemiBold,
      headlineSmall: AppStyles.secText14Regular,
      titleMedium: AppStyles.mainText16Medium,
      titleSmall: AppStyles.mainColor14SemiBoldDecorated,
      bodyMedium: AppStyles.mainColor16Medium,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        side: BorderSide(color: AppColors.stroke),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
    ),
    hintColor: AppColors.secText,
     cardColor: AppColors.mainColor,
     dividerColor: AppColors.stroke,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(textStyle: AppStyles.white20Medium),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.bgDarkMode,
    textTheme: TextTheme(
      headlineLarge: AppStyles.white24SemiBold,
      headlineMedium: AppStyles.white20SemiBold,
      headlineSmall: AppStyles.secTextDarkMode14Regular,
      titleMedium: AppStyles.white16Medium,
      titleSmall: AppStyles.mainDarkMode14SemiBoldDecorated,
      bodyMedium: AppStyles.mainDarkModer16Medium,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: AppColors.inputs,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        side: BorderSide(color: AppColors.strokeDark),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.bgDarkMode,
    ),
    hintColor: AppColors.secTextDarkMode,
     cardColor: AppColors.mainDarkMode,
     dividerColor: AppColors.strokeDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(textStyle: AppStyles.white20Medium),
    ),
  );
}
