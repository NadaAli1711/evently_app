import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_context.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../widgets/buttons/custom_elevated_button.dart';
import '../widgets/custom_rows/custom_header.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(child: Column(
        spacing: height*0.05,
        children: [
          CustomHeader(headerText: 'forget_password'.tr(),),
          Image.asset(themeProvider.isDark?AppImages.forgetPasswordDark:AppImages.forgetPasswordLight),
          CustomElevatedButton(onPressed: (){},child: Text('reset_password'.tr(),))
        ],
      )),
    );
  }
}
