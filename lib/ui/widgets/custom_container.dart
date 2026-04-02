import 'package:flutter/material.dart';

import '../../core/utils/app_context.dart';

class CustomContainer extends StatelessWidget {
  final double containerHeight;
  final Widget child;
  const CustomContainer({super.key,required this.containerHeight,required this.child});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return Container(
      height: containerHeight,
      padding: EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.03),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: BoxBorder.all(
          color:Theme.of(context).dividerColor,
        ),
      ),
      child: child
    );
  }
}
