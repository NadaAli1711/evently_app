import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
typedef OnTap = void Function(int) ;
class CustomBottomNavigationBar extends StatefulWidget {
  final OnTap onTap;
  final int selectedIndex;
  const CustomBottomNavigationBar({super.key,required this.onTap,required this.selectedIndex});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      buildBottomNavigationBarItem(index: 0,selectedIcon:AppImages.selectedHome,unSelectedIcon:AppImages.unSelectedHome, label: AppLocalizations.of(context)!.home),
      buildBottomNavigationBarItem(index: 1,selectedIcon:AppImages.selectedHeart,unSelectedIcon:AppImages.unSelectedHeart,label:  AppLocalizations.of(context)!.favorite),
      buildBottomNavigationBarItem(index: 2,selectedIcon:AppImages.selectedUser,unSelectedIcon: AppImages.unSelectedUser,label:  AppLocalizations.of(context)!.profile)
    ],onTap: widget.onTap,currentIndex: widget.selectedIndex,selectedItemColor: Theme.of(context).cardColor,unselectedItemColor: AppColors.disable);
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      {required String selectedIcon,required String unSelectedIcon,required String label,required int index}){
    return BottomNavigationBarItem(icon: ImageIcon(AssetImage(widget.selectedIndex == index?selectedIcon:unSelectedIcon)),label: label);

  }
}
