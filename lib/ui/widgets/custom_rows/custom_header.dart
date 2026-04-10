import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_context.dart';
import 'package:flutter/material.dart';

import '../buttons/custom_icon_button.dart';

class CustomHeader extends StatelessWidget {
  final bool hasTrailing;
  final String headerText;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  const CustomHeader({super.key,this.hasTrailing = false,required this.headerText,this.onDelete,this.onEdit});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return Row(
        children:[ CustomIconButton(),
       Expanded(child: Text(textAlign: .center,headerText,style: Theme.of(context).textTheme.displayMedium,)),
      if(hasTrailing)...[
        CustomIconButton(onPressed: onEdit,icon: Icons.edit,iconColor: Theme.of(context).cardColor,),
        CustomIconButton(onPressed: onDelete,icon: Icons.delete_outline,iconColor: AppColors.red,)
      ]else SizedBox(width: width*.09,) ]
    );
  }
}
