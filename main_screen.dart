import 'package:flutter/material.dart';

import '../constants.dart';
import '../profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          Scaffold(),
          Scaffold(),
          Scaffold(),
          Scaffold(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.search,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.smart_display_outlined,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.smart_display,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_mall_outlined,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.local_mall,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(profileImage),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}