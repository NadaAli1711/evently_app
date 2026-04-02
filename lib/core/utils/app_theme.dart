import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      headlineLarge: AppStyles.mainColor24SemiBold,
      headlineMedium: AppStyles.mainText20SemiBold,
      headlineSmall: AppStyles.secText14Regular,
      bodySmall: AppStyles.secText16Regular,
      titleMedium: AppStyles.mainText16Medium,
      titleSmall: AppStyles.mainColor14SemiBoldDecorated,
      bodyMedium: AppStyles.mainColor16Medium,
      bodyLarge: AppStyles.mainColor16SemiBold,
      titleLarge: AppStyles.mainText20Medium,
      displayLarge: AppStyles.mainText20SemiBold,
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
    primaryColor: AppColors.white,
    disabledColor: AppColors.disable,
    focusColor: AppColors.mainColor,
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.bgDarkMode,
    textTheme: TextTheme(
      headlineLarge: AppStyles.white24SemiBold,
      headlineMedium: AppStyles.white20SemiBold,
      headlineSmall: AppStyles.secTextDarkMode14Regular,
      bodySmall: AppStyles.secTextDarkMode16Regular,
      titleMedium: AppStyles.white16Medium,
      titleSmall: AppStyles.mainDarkMode14SemiBoldDecorated,
      bodyMedium: AppStyles.mainDarkMode16Medium,
      bodyLarge: AppStyles.mainDarkMode16SemiBold,
      titleLarge: AppStyles.white20Medium,
      displayLarge: AppStyles.white20SemiBold,
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
    primaryColor: AppColors.inputs,
    disabledColor: AppColors.background,
    focusColor: AppColors.white,

  );
}
