import 'package:flutter/material.dart';
typedef OnTap = void Function(int) ;
class CustomBottomNavigationBar extends StatelessWidget {
  final OnTap onTap;
  const CustomBottomNavigationBar({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      buildBottomNavigationBarItem(icon: Icons.home_filled, label: 'Home'),
      buildBottomNavigationBarItem(icon:Icons.favorite_border_outlined,label: 'Favorite'),
      buildBottomNavigationBarItem(icon: Icons.person,label: 'profile')
    ],onTap: onTap);
  }
  BottomNavigationBarItem buildBottomNavigationBarItem(
      {required IconData icon,required String label}){
    return BottomNavigationBarItem(icon: Icon(icon),label: label);

  }
}
