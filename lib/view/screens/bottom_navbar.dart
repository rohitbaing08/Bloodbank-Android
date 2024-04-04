import 'package:bloodbank_management/view/screens/camps_list_view.dart';
import 'package:bloodbank_management/view/screens/helpline_view.dart';
import 'package:bloodbank_management/view/screens/home_view.dart';
import 'package:bloodbank_management/view/screens/profile_view.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final screens = [
    const HomeView(),
    const CampsListView(),
    const HelplineView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed display all items
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.campaign), label: 'Camps'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Helpline'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
