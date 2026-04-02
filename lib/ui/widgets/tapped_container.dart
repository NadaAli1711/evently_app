import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_context.dart';
import '../../core/utils/app_styles.dart';

class TappedContainer extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final bool hasIcon;
  final bool hasText;
  final String iconName;
  final String text;
  final Color? iconColor;
  const TappedContainer({
    super.key,
    required this.onTap,
    this.isSelected = false,
    this.iconName = '',
    this.text = '',
    this.hasIcon = true,
    this.hasText = true,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.04,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(
            color: isSelected
                ? AppColors.transparent
                : Theme.of(context).dividerColor,
          ),
          color: isSelected
              ? Theme.of(context).cardColor
              : Theme.of(context).primaryColor,
        ),
        child: Row(
          spacing: width * 0.02,
          children: [
            if (hasIcon) ImageIcon(AssetImage(iconName),color:  isSelected?AppColors.white:Theme.of(context).cardColor,),
            if (hasText)
              Text(
                text,
                style: isSelected
                    ? AppStyles.white16Medium
                    : Theme.of(context).textTheme.titleMedium,
              ),
          ],
        ),
      ),
    );
  }
}
