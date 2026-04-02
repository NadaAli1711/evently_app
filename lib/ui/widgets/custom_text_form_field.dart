import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color suffixIconColor;


  const CustomTextFormField({super.key, required this.hintText,this.prefixIcon,this.suffixIcon,this.suffixIconColor= AppColors.disable});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.disable,
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
