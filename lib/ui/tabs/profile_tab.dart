import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_context.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/theme_provider.dart';
import '../widgets/language_bottom_sheet.dart';
import '../widgets/profile_list_tile.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      spacing: height*0.02,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(AppImages.profileImg),
          radius: 50,
        ),
        Text('John Safwat', style: Theme.of(context).textTheme.headlineLarge),
        Text(
          'johnsafwat.route@gmail.com',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: height*0.02),
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
    );
  }

  void showBottomModalSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  // void showThemeBottomModalSheet() {
  //   showModalBottomSheet(context: context, builder: (context)=>ThemeBottomSheet());
  // }
}
