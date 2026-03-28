import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      buildBottomNavigationBarItem(icon: Icons.home_filled, label: 'Home'),
      buildBottomNavigationBarItem(icon:Icons.favorite_border_outlined,label: 'Favorite'),
      buildBottomNavigationBarItem(icon: Icons.person,label: 'profile')
    ],);
  }
  BottomNavigationBarItem buildBottomNavigationBarItem(
      {required IconData icon,required String label}){
    return BottomNavigationBarItem(icon: Icon(icon),label: label);

  }
}
