// import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_colors.dart';
// import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/app_assets.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/custom_floating_action_button.dart';
import '../widgets/language_bottom_sheet.dart';
import '../widgets/profile_list_tile.dart';
// import '../widgets/theme_bottom_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            spacing: 16,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(AppImages.profileImg),
                radius: 50,
              ),
              Text(
                'John Safwat',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'johnsafwat.route@gmail.com',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 16),
              ProfileListTile(
                text: AppLocalizations.of(context)!.theme_mode,
                child:
                    // IconButton(
                    //   onPressed: () {
                    //     showThemeBottomModalSheet();
                    //   },
                    //   icon: Icon(Icons.arrow_forward_ios_rounded),
                    // ),
                    Switch(
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
                    ),
              ),

              ProfileListTile(
                text: AppLocalizations.of(context)!.language,
                child: IconButton(
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
              ProfileListTile(
                text: AppLocalizations.of(context)!.logout,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.logout_rounded, color: AppColors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showBottomModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  // void showThemeBottomModalSheet() {
  //   showModalBottomSheet(context: context, builder: (context)=>ThemeBottomSheet());
  // }
}
