import 'package:evently_app/ui/widgets/tapped_container.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_context.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';
import 'custom_elevated_button.dart';

class IntroductionBody extends StatelessWidget {
  final String lightAssetName;
  final String darkAssetName;
  final String firstText;
  final String buttonText;
  final bool isIntroScreen;
  final String secondText;
  final VoidCallback onPressed;
  final int currentIndex;
  const IntroductionBody({
    super.key,
    required this.lightAssetName,
    required this.darkAssetName,
    required this.firstText,
    required this.buttonText,
    required this.onPressed,
    required this.currentIndex,
    this.isIntroScreen = false,

    this.secondText = "",

  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    double width = context.width;
    double height = context.height;
    return Column(

      crossAxisAlignment: .start,
      spacing: height * 0.02,
      children: [
        Image.asset(
          themeProvider.isDark ? darkAssetName : lightAssetName,
          width: double.infinity,
          fit: .fill,
        ),
        Visibility(
          visible: !isIntroScreen,
          child: Center(
            child: DotsIndicator(
              dotsCount: 3,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(
                activeSize: const Size(20.92, 8.0),
                activeColor: Theme.of(context).cardColor,
                color:Theme.of(context).disabledColor,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0),
                ),
              ),
            ),
          ),
        ),

        Text(firstText, style: Theme.of(context).textTheme.displayLarge),
        Text(secondText, style: Theme.of(context).textTheme.bodySmall),
        if (isIntroScreen) ...[
          Row(
            spacing: width * 0.02,
            children: [
              Text(AppLocalizations.of(context)!.language),
              Spacer(),
              TappedContainer(
                onTap: () {
                  languageProvider.toggleLanguage();
                },
                isSelected: languageProvider.isEnglish,
                text: AppLocalizations.of(context)!.english,
                hasIcon: false,
              ),
              TappedContainer(
                onTap: () {
                  languageProvider.toggleLanguage();
                },
                isSelected: !languageProvider.isEnglish,
                text: AppLocalizations.of(context)!.arabic,
                hasIcon: false,
              ),
            ],
          ),
          Row(
            spacing: width * 0.02,
            children: [
              Text(AppLocalizations.of(context)!.theme_mode),
              Spacer(),
              TappedContainer(
                onTap: () {
                  themeProvider.toggleTheme();
                },
                isSelected: !themeProvider.isDark,
                iconName: !themeProvider.isDark
                    ? AppImages.selectedSun
                    : AppImages.sun,
                hasText: false,
                iconColor: AppColors.white,
              ),
              TappedContainer(
                onTap: () {
                  themeProvider.toggleTheme();
                },
                isSelected: themeProvider.isDark,
                iconName: !themeProvider.isDark
                    ? AppImages.moon
                    : AppImages.selectedMoon,
                hasText: false,
                iconColor: themeProvider.isDark
                    ? AppColors.white
                    : Theme.of(context).cardColor,
              ),
            ],
          ),
        ],

        CustomElevatedButton(onPressed: onPressed, child: Text(buttonText)),
      ],
    );
  }
}
