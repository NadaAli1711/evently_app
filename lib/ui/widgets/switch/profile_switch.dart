import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../providers/theme_provider.dart';

class ProfileSwitch extends StatelessWidget {
  const ProfileSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Switch(
      value: themeProvider.isDark,
      onChanged: (value) => themeProvider.changeTheme(
        value ? ThemeMode.dark : ThemeMode.light,
      ),
      activeTrackColor: AppColors.mainDarkMode,
      inactiveTrackColor: AppColors.gray,
      inactiveThumbColor: AppColors.white,
      trackOutlineColor: WidgetStateProperty.all(
        AppColors.transparent,
      ),
    );
  }
}
