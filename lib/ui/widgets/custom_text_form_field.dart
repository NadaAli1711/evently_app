import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color suffixIconColor;
  final Color prefixIconColor;
  final int? minLines;
  final int? maxLines;
  final TextEditingController controller;

  // ضفنا دول عشان الـ Validation والباسورد
  final String? Function(String?)? validator;
  final bool isPassword;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconColor = AppColors.disable,
    this.prefixIconColor = AppColors.disable,
    this.minLines,
    this.maxLines,
    this.validator, // ممرر هنا
    this.isPassword = false, // القيمة الافتراضية مش باسورد
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator, // أهم سطر للـ Validation
      obscureText: isPassword, // عشان يخفي النجوم لو باسورد
      minLines: minLines,
      maxLines: isPassword ? 1 : maxLines, // الباسورد لازم يكون سطر واحد عشان obscureText تشتغل

      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIconColor: suffixIconColor,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.headlineSmall,

        // الحدود (Borders)
        focusedBorder: buildBorder(color: Theme.of(context).dividerColor),
        enabledBorder: buildBorder(color: Theme.of(context).dividerColor),
        errorBorder: buildBorder(color: AppColors.red),
        focusedErrorBorder: buildBorder(color: AppColors.red),

        // ستايل رسالة الخطأ نفسها
        errorStyle: const TextStyle(color: AppColors.red),
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}