import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color borderColor;
  final Color foregroundColor;
  final Color? backgroundColor;
  final TextStyle textStyle;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderColor = AppColors.transparent,
    this.foregroundColor = AppColors.white,
    this.textStyle = AppStyles.white20Medium,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 0),
        elevation: 0,
        textStyle: textStyle,
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: child,
    );
  }
}
