import 'package:flutter/material.dart';

import '../../../core/utils/app_context.dart';

class CustomContainer extends StatelessWidget {
  final double containerHeight;
  final Widget? child;
  final String image;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double borderRadius;
  final double? containerWidth;
  final bool hasBackgroundImage;
  const CustomContainer({
    super.key,
    required this.containerHeight,
    this.child,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderRadius = 8,
    this.hasBackgroundImage = false,
    this.image='',
    this.containerWidth
  });

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return Container(
      height: containerHeight,
      width:containerWidth,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? height * 0.01,
        horizontal: horizontalPadding ?? width * 0.03,
      ),
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: BoxBorder.all(color: Theme.of(context).dividerColor),
        image: hasBackgroundImage ? DecorationImage(
          image: AssetImage(
            image
          ),
          fit: BoxFit.fill,
        ) : null,
      ),
      child: child,
    );
  }
}
