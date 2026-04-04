import 'package:evently_app/core/utils/app_context.dart';
import 'package:flutter/material.dart';

import '../buttons/custom_text_button.dart';

class DateTimeRow extends StatelessWidget {
  final IconData? icon;
  final String titleText;
  final String buttonText;
  const DateTimeRow({super.key,required this.icon,required this.titleText,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return Row(spacing: width*0.02,
      children: [
      Icon(icon,color: Theme.of(context).cardColor,),
      Text(titleText,style: Theme.of(context).textTheme.titleMedium,),
      Spacer(),
      CustomTextButton(onPressed: (){},text: buttonText,)

    ],);
  }
}
