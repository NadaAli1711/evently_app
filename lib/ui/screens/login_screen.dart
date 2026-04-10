import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_context.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_styles.dart';
import '../../core/utils/firebase_utils/auth_utils.dart';
import '../../providers/user_provider.dart';
import '../screens/register_screen.dart';
import '../widgets/buttons/custom_text_button.dart';
import '../widgets/custom_rows/or_divider.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    double width = context.width;
    double height = context.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.05),
                  themeProvider.isDark
                      ? Image.asset(AppImages.eventlyDarkLogo)
                      : Image.asset(AppImages.eventlyLogo),
                  SizedBox(height: height * 0.03),
                  Text(
                    'login_to_your_account'.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: height * 0.02),


                  CustomTextFormField(
                    hintText: 'enter_your_email'.tr(),
                    prefixIcon: const Icon(Icons.mail_outlined),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'email_required'.tr();
                      }

                      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'invalid_email'.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),

                  CustomTextFormField(
                    hintText: 'enter_your_password'.tr(),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const Icon(Icons.visibility_off),
                    controller: passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password_required'.tr();
                      }
                      if (value.length < 6) {
                        return 'password_too_short'.tr();
                      }
                      return null;
                    },
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(
                      text: 'forget_password'.tr(),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.forgetPasswordScreen);
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  CustomElevatedButton(
                    onPressed: login,
                    child: Text('login'.tr()),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'do_not_have_an_account'.tr(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, AppRoutes.registerScreen);
                        },
                        text: 'signup'.tr(),
                      ),
                    ],
                  ),
                  const OrDivider(),
                  CustomElevatedButton(
                    backgroundColor: AppColors.transparent,
                    textStyle: AppStyles.mainDarkModer18Medium,
                    borderColor: Theme.of(context).dividerColor,
                    foregroundColor: Theme.of(context).cardColor,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.google),
                        SizedBox(width: width * 0.04),
                        Text('login_with_google'.tr()),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      DialogUtils.showLoading(context);

      AuthUtils.login(
        emailAddress: emailController.text.trim(),
        password: passwordController.text,
      ).then((user) {
        DialogUtils.hideLoading(context);

        if (!mounted) return;
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(user);

        Navigator.of(context).pushReplacementNamed(AppRoutes.mainScreen);
      }).catchError((error) {
        DialogUtils.hideLoading(context);

        String errorMessage = 'something_went_wrong'.tr();
        if (error.toString().contains('user-not-found') || error.toString().contains('wrong-password') || error.toString().contains('invalid-credential')) {
          errorMessage = 'invalid_email_or_password'.tr();
        }

        DialogUtils.showMessage(context, errorMessage);
      });
    }
  }
}