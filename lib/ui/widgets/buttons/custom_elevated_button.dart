import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_context.dart';
import '../../../core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color borderColor;
  final Color foregroundColor;
  final Color? backgroundColor;
  final TextStyle textStyle;
  final double borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Size? minimumSize;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderColor = AppColors.transparent,
    this.foregroundColor = AppColors.white,
    this.textStyle = AppStyles.white20Medium,
    this.backgroundColor,
    this.borderRadius=16,
    this.verticalPadding,
    this.horizontalPadding,
    this.minimumSize
  });

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize??const Size(double.infinity, 0),
        elevation: 0,
        textStyle: textStyle,
        padding: EdgeInsets.symmetric(vertical: verticalPadding??height*0.02, horizontal: horizontalPadding??0),
        backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: child,
    );
  }
}
