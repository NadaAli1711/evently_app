import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/language_provider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_context.dart';
import '../widgets/horizontal_list_view.dart';
import '../widgets/vertical_list_view.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Column(
      spacing: height * 0.025,
      children: [
        Row(
          spacing: width * 0.02,
          children: [
            Column(
              spacing: height * 0.02,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome_back,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'John Safwat',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Spacer(),
            IconButton(onPressed: (){
              themeProvider.toggleTheme();

            },icon: ImageIcon(AssetImage(themeProvider.isDark ? AppImages.moon : AppImages.sun),color: Theme.of(context).cardColor)),
            // InkWell(
            //   onTap:() => languageProvider.toggleLanguage() ,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: width * 0.03,
            //       vertical: height * 0.01,
            //     ),
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).cardColor,
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: Text(
            //       languageProvider.languageCode.toUpperCase(),
            //       style: AppStyles.white14SemiBold,
            //     ),
            //   ),
            // ),
            ElevatedButton(onPressed: () => languageProvider.toggleLanguage() ,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.01,
              ),
              minimumSize: Size.zero,
              backgroundColor: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ), child: Text(
              languageProvider.languageCode.toUpperCase(),
              style: AppStyles.white14SemiBold,
            ),)

          ],
        ),
        SizedBox(height: height * 0.05, child: HorizontalListView()),
        Expanded(child: VerticalListView()),
      ],
    );
  }
}
