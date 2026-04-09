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
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLines,
      maxLines:
          null, // to expand as you like and prevent the error when min lines is larger than the default of max lines which is 1 so null is larger than any value
      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIconColor: suffixIconColor,
        hintText: hintText,

        hintStyle: Theme.of(context).textTheme.headlineSmall,
        focusedBorder: buildBorder(color: Theme.of(context).dividerColor),
        enabledBorder: buildBorder(color: Theme.of(context).dividerColor),
        errorBorder: buildBorder(color: AppColors.red),
        focusedErrorBorder: buildBorder(color: AppColors.red),
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
