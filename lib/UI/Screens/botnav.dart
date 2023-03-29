import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fyp/UI/Screens/dashboard.dart';
import 'package:fyp/UI/Screens/schedule.dart';
import 'package:fyp/UI/Screens/services.dart';

import '../../Extracted Widgets/custom_text.dart';
import 'profile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final _children = [Dashboard(), Schedule(), Services(), Profile()];

  void _onChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          _onChanged(0);
        } else if (_currentIndex == 0) {
          await showDialog(
              context: context,
              builder: (builder) {
                return AlertDialog(
                  title: CustomText(text: 'Alert'),
                  content: CustomText(text: 'Do you want to quit the app?'),
                  actions: [
                    TextButton(
                        onPressed: () {},
                        child: CustomText(
                          text: 'Yes',
                        )),
                    TextButton(
                        onPressed: () {},
                        child: CustomText(
                          text: 'No',
                        )),
                  ],
                );
              });
        }
        return false;
      },
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: _currentIndex,
            items: [
              BottomNavyBarItem(
                  icon: Icon(Icons.home_outlined),
                  title: CustomText(text: 'Home'),
                  activeColor: Colors.blue),
              BottomNavyBarItem(
                  icon: Icon(Icons.schedule_outlined),
                  title: CustomText(text: 'Schedule'),
                  activeColor: Colors.purple),
              BottomNavyBarItem(
                  icon: Icon(Icons.medical_services_outlined),
                  title: CustomText(text: 'Services'),
                  activeColor: Colors.orange),
              BottomNavyBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  title: CustomText(text: 'Profile'),
                  activeColor: Colors.green),
            ],
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            }),
      ),
    );
  }
}
