import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_context.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return Row(
      children: [
        Expanded(child: Divider(endIndent: width * 0.05,color: Theme.of(context).dividerColor)),
        Text(
          'or'.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(child: Divider(indent: width * 0.05,color: Theme.of(context).dividerColor)),
      ],
    );
  }
}
