import 'package:evently_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_context.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/theme_provider.dart';
import '../widgets/introduction_body.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    double height = context.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:context.width*0.02,vertical:height*0.03 ),
          child: Column(
            spacing: height*0.02,
            children: [
              Image.asset(
                themeProvider.isDark
                    ? AppImages.eventlyDarkLogo
                    : AppImages.eventlyLogo,
                fit: .fill,
              ),
              IntroductionBody(
                currentIndex: 0,
                buttonText: AppLocalizations.of(context)!.let_s_start,
                firstText: AppLocalizations.of(
                  context,
                )!.personalize_your_experience,
                secondText: AppLocalizations.of(
                  context,
                )!.choose_your_preferred_theme_and_language_to_get_started_with_a_comfortable_tailored_experience_that_suits_your_style,
                darkAssetName: AppImages.beingCreativeDark,
                lightAssetName: AppImages.beingCreative,
                isIntroScreen: true,
                onPressed: ()=>Navigator.of(context).pushReplacementNamed(AppRoutes.onBoardingScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
