import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return FloatingActionButton(onPressed: (){Navigator.of(context).pushNamed(AppRoutes.addEventScreen);},child: Icon(Icons.add,color: AppColors.white,),shape:CircleBorder(

    ),backgroundColor: themeProvider.isDark? AppColors.mainDarkMode: AppColors.mainColor,);
  }
}
