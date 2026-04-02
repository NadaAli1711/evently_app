import 'package:evently_app/ui/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/custom_floating_action_button.dart';
import '../tabs/favorite_tab.dart';
import '../tabs/home_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(),FavoriteTab(),ProfileTab()];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      bottomNavigationBar: CustomBottomNavigationBar(onTap: (index) {
        selectedIndex = index;
        setState(() {
        });
      },selectedIndex: selectedIndex,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: tabs[selectedIndex],
        ),
      ),
    );
  }


}
