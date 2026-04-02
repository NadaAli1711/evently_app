import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_context.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/theme_provider.dart';
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
    return Column(
      spacing: height * 0.02,
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
        SizedBox(height: height * 0.02),
        ListTile(
          title: Text(
            AppLocalizations.of(context)!.theme_mode,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: ProfileSwitch(),
        ),

        ListTile(
          title: Text(
            AppLocalizations.of(context)!.language,
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
            AppLocalizations.of(context)!.logout,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: IconButton(
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
}
