import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_context.dart';
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
                buttonText: 'let_s_start'.tr(),
                firstText:'personalize_your_experience'.tr(),
                secondText: 'choose_your_preferred_theme_and_language_to_get_started_with_a_comfortable_tailored_experience_that_suits_your_style'.tr(),
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
