import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_context.dart';
import '../../core/utils/app_styles.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/buttons/custom_text_button.dart';
import '../widgets/custom_rows/or_divider.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    double width = context.width;
    double height = context.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: height * 0.02,
            children: [
              themeProvider.isDark
                  ? Image.asset(AppImages.eventlyDarkLogo)
                  : Image.asset(AppImages.eventlyLogo),
              Text(
                'login_to_your_account'.tr(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: height * 0.002),
              CustomTextFormField(
                hintText: 'enter_your_name'.tr(),
                prefixIcon: Icon(Icons.person_outline),
              ),
              CustomTextFormField(
                hintText: 'enter_your_email'.tr(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              CustomTextFormField(
                hintText: 'enter_your_password'.tr(),
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: Icon(Icons.visibility_off),
              ),
              CustomTextFormField(
                hintText: 'confirm_your_password'.tr(),
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: Icon(Icons.visibility_off),
              ),

              SizedBox(height: height * 0.01),
              CustomElevatedButton(
                onPressed: () {},
                child: Text('signup'.tr()),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    'already_have_an_account'.tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
                    },
                    text: 'login'.tr(),
                  ),
                ],
              ),
              OrDivider(),

              CustomElevatedButton(
                backgroundColor: AppColors.transparent,
                textStyle: AppStyles.mainDarkModer18Medium,
                borderColor: Theme.of(context).dividerColor,
                foregroundColor: Theme.of(context).cardColor,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: .center,
                  spacing: width * 0.04,
                  children: [
                    Image.asset(AppImages.google),
                    Text('sign_up_with_Google'.tr()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
