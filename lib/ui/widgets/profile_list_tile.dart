// import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String text;
  final Widget child;
  const ProfileListTile({super.key, required this.text, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text,style: Theme.of(context).textTheme.titleMedium,),
      trailing: child,
    );
  }
}
