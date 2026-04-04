import 'package:evently_app/core/utils/app_context.dart';
import 'package:flutter/material.dart';

import '../buttons/custom_icon_button.dart';

class CustomHeader extends StatelessWidget {
  final bool hasTrailing;
  final String headerText;
  const CustomHeader({super.key,this.hasTrailing = false,required this.headerText});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return Row(mainAxisAlignment: .spaceBetween
    ,children:[ CustomIconButton(),
       Text(headerText,style: Theme.of(context).textTheme.displayMedium,),
      if(hasTrailing)...[
        CustomIconButton(onPressed: (){},icon: Icons.edit,),
        CustomIconButton(onPressed: (){},icon: Icons.delete,)
      ]else SizedBox(width: width*.09,) ]
    );
  }
}
