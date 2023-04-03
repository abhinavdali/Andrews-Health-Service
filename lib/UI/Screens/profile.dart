import 'package:flutter/material.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/SharedPreference/sharedPreference.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';
import '../loginandsignup/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'My Profile',
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: kColorGrey,
      body: ListView(padding: EdgeInsets.symmetric(vertical: 30), children: [
        SizedBox(
          height: 3.h,
        ),
        CircleAvatar(
          radius: 50,
        ),
        SizedBox(
          height: 1.h,
        ),
        Center(
            child: CustomText(
          text: 'John Cena',
          fontSize: 16.sp,
          weight: FontWeight.w500,
        )),
        Divider(
          color: Colors.grey,
        ),
        SizedBox(
          height: 1.h,
        ),
        ProfileRow(
          icon: Icons.fingerprint,
          title: 'Setup Fingerprint',
          widget: Switch(
              value: isSwitch,
              onChanged: (value) {
                setState(() {
                  isSwitch = !isSwitch;
                });
              }),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (builder) {
                  return AlertDialog(
                    content: Container(
                      height: 10.h,
                      width: 200,
                      decoration: BoxDecoration(color: Colors.white),
                      padding: EdgeInsets.all(0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CustomText(
                                  text: 'Alert',
                                  fontSize: 13.sp,
                                ),
                                CustomText(
                                    text: 'Are you sure you want to log out?'),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: CustomText(
                                      text: 'No',
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      UserPreferences.logout();
                                      Navigator.pushAndRemoveUntil(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Login();
                                      }), (route) => false);
                                    },
                                    child: CustomText(
                                      text: 'Yes',
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  );
                });
          },
          child: ProfileRow(
            icon: Icons.logout,
            title: 'Logout',
            widget: SizedBox(),
          ),
        )
      ]),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final icon, title;
  final Widget? widget;
  const ProfileRow(
      {Key? key, required this.icon, required this.title, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.blue,
              ),
              SizedBox(
                width: 8,
              ),
              CustomText(
                text: title,
                fontSize: 11.sp,
                weight: FontWeight.w500,
              ),
            ],
          ),
          widget!
        ],
      ),
    );
  }
}
