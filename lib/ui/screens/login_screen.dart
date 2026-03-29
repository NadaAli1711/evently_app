import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_context.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_styles.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    double width = context.width;
    double height = context.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.02),
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: height*0.02,
            children: [
              themeProvider.isDark? Image.asset(AppImages.eventlyDarkLogo): Image.asset(AppImages.eventlyLogo),
              Text(AppLocalizations.of(context)!.login_to_your_account,style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox(height: height*0.002,),
              CustomTextFormField(hintText: AppLocalizations.of(context)!.enter_your_email,prefixIcon: Icon(Icons.email_outlined),),
              CustomTextFormField(hintText: AppLocalizations.of(context)!.enter_your_password,prefixIcon: Icon(Icons.lock_outline),suffixIcon: Icon(Icons.visibility_off),),
              Align(alignment: .centerRight,child: CustomTextButton(text: AppLocalizations.of(context)!.forget_password,onPressed: (){},)),
              SizedBox(height: height*0.01,),
              CustomElevatedButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.login)),
              Row(mainAxisAlignment: .center,children: [
                Text(AppLocalizations.of(context)!.do_not_have_an_account,style: Theme.of(context).textTheme.headlineSmall,),
                CustomTextButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, AppRoutes.registerScreen);
                }, text: AppLocalizations.of(context)!.signup),

              ],),
              Row(
                children: [
                Expanded(child: Divider(endIndent: width*0.05,color: Theme.of(context).dividerColor)),
                Text(AppLocalizations.of(context)!.or,style: Theme.of(context).textTheme.bodyMedium,),
                Expanded(child: Divider(indent: width*0.05,color: Theme.of(context).dividerColor)),
              ],),

              CustomElevatedButton(
                  backgroundColor: AppColors.transparent,
                  textStyle: AppStyles.mainDarkModer18Medium,
                  borderColor: Theme.of(context).dividerColor,
                  foregroundColor: Theme.of(context).cardColor,
                  onPressed: (){}, child: Row(
                mainAxisAlignment: .center,
                spacing: width*0.04,
                children: [
                  Image.asset(AppImages.google),
                  Text(AppLocalizations.of(context)!.login_with_google),
                ],
              )),


            ],
          ),
        ),
      ),
    );
  }
}
