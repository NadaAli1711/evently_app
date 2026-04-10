import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_context.dart';
import '../../core/utils/firebase_utils/auth_utils.dart';
import '../../providers/theme_provider.dart';
import '../../providers/user_provider.dart';
import '../widgets/language_bottom_sheet/language_bottom_sheet.dart';
import '../widgets/switch/profile_switch.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    double height = context.height;
    var themeProvider = Provider.of<ThemeProvider>(context);

    var userProvider = Provider.of<UserProvider>(context);
    var currentUser = userProvider.currentUser;

    return Column(
      spacing: height * 0.02,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage(AppImages.profileImg),
          radius: 50,
        ),

        Text(
          currentUser?.name ?? 'Guest User',
          style: Theme.of(context).textTheme.headlineLarge,
        ),

        Text(
          currentUser?.email ?? 'No Email Found',
          style: Theme.of(context).textTheme.headlineSmall,
        ),

        SizedBox(height: height * 0.02),

        ListTile(
          title: Text(
            'theme_mode'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: const ProfileSwitch(),
        ),

        ListTile(
          title: Text(
            'language'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: IconButton(
            onPressed: () {
              showBottomModalSheet();
            },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: themeProvider.isDark
                  ? AppColors.mainDarkMode
                  : AppColors.mainColor,
            ),
          ),
        ),

        ListTile(
          title: Text(
            'logout'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: IconButton(
            onPressed: () {
              AuthUtils.logout();
              userProvider.logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.loginScreen,
                    (route) => false,
              );
            },
            icon: const Icon(Icons.logout_rounded, color: AppColors.red),
          ),
        ),
      ],
    );
  }

  void showBottomModalSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (context) => const LanguageBottomSheet(),
    );
  }
}