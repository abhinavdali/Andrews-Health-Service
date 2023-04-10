import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/UI/Screens/dashboard.dart';
import 'package:fyp/UI/Screens/appointment.dart';
import 'package:fyp/UI/Screens/favourite.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';
import 'profile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final _children = [Dashboard(), Appointment(), Favourites(), Profile()];

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
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: CustomText(
                          text: 'Yes',
                          color: Colors.blue,
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: CustomText(
                          text: 'No',
                          color: Colors.red,
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
                  title: CustomText(
                    text: 'Home',
                    fontSize: 10.sp,
                  ),
                  activeColor: Colors.blue),
              BottomNavyBarItem(
                  icon: Icon(Icons.schedule_outlined),
                  title: CustomText(
                    text: 'Appointment',
                    fontSize: 10.sp,
                  ),
                  activeColor: Colors.purple),
              BottomNavyBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  title: CustomText(
                    text: 'Favourite',
                    fontSize: 10.sp,
                  ),
                  activeColor: Colors.orange),
              BottomNavyBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  title: CustomText(
                    text: 'Profile',
                    fontSize: 10.sp,
                  ),
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
