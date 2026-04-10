import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_context.dart';
import '../../core/utils/app_styles.dart';
import '../../core/utils/firebase_utils/auth_utils.dart';
import '../../providers/theme_provider.dart';
import '../../providers/user_provider.dart';
import '../widgets/buttons/custom_elevated_button.dart';
import '../widgets/buttons/custom_text_button.dart';
import '../widgets/custom_rows/or_divider.dart';
import '../widgets/custom_text_form_field.dart';

// --- كلاس مساعد للديالوج ---
class DialogUtils {
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 20),
              Text("loading".tr()),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatedpasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    double width = context.width;
    double height = context.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.02),
                  themeProvider.isDark
                      ? Image.asset(AppImages.eventlyDarkLogo)
                      : Image.asset(AppImages.eventlyLogo),
                  SizedBox(height: height * 0.02),
                  Text(
                    'create_your_account'.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: height * 0.02),

                  // حقل الاسم
                  CustomTextFormField(
                    hintText: 'enter_your_name'.tr(),
                    prefixIcon: const Icon(Icons.person_outline),
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'name_required'.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),

                  // حقل الإيميل
                  CustomTextFormField(
                    hintText: 'enter_your_email'.tr(),
                    controller: emailController,
                    prefixIcon: const Icon(Icons.email_outlined),
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

                  // حقل الباسورد
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
                  SizedBox(height: height * 0.02),

                  // حقل تأكيد الباسورد
                  CustomTextFormField(
                    hintText: 'confirm_your_password'.tr(),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const Icon(Icons.visibility_off),
                    controller: repeatedpasswordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'confirm_password_required'.tr();
                      }
                      if (value != passwordController.text) {
                        return 'passwords_dont_match'.tr();
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: height * 0.03),
                  CustomElevatedButton(
                    onPressed: register,
                    child: Text('signup'.tr()),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already_have_an_account'.tr(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.loginScreen,
                          );
                        },
                        text: 'login'.tr(),
                      ),
                    ],
                  ),
                  const OrDivider(),

                  CustomElevatedButton(
                    backgroundColor: AppColors.transparent,
                    textStyle: AppStyles.mainDarkModer18Medium,
                    borderColor: Theme.of(context).dividerColor,
                    foregroundColor: Theme.of(context).cardColor,
                    onPressed: () {
                      // Google Sign up logic
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.google),
                        SizedBox(width: width * 0.04),
                        Text('sign_up_with_Google'.tr()),
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

  void register() {
    if (formKey.currentState!.validate()) {
      // 1. إظهار الديالوج فوراً لمنع أي ضغط زيادة
      DialogUtils.showLoading(context);

      AuthUtils.register(
        emailAddress: emailController.text.trim(),
        password: passwordController.text,
        name: nameController.text.trim(),
      ).then((user) {
        // 2. نجاح: اقفل الديالوج وانقل المستخدم
        DialogUtils.hideLoading(context);

        if (!mounted) return;
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(user);

        Navigator.of(context).pushReplacementNamed(AppRoutes.mainScreen);
      }).catchError((error) {
        // 3. فشل: اقفل الديالوج واظهر رسالة الخطأ
        DialogUtils.hideLoading(context);

        String errorMessage = 'something_went_wrong'.tr();
        if (error.toString().contains('email-already-in-use')) {
          errorMessage = 'email_already_in_use'.tr();
        } else if (error.toString().contains('network-request-failed')) {
          errorMessage = 'check_your_internet'.tr();
        }

        DialogUtils.showMessage(context, errorMessage);
      });
    }
  }
}