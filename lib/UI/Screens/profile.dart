import 'package:flutter/material.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/SharedPreference/sharedPreference.dart';
import 'package:fyp/UI/Screens/feedback.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';
import '../loginandsignup/login.dart';
import 'my_reports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSwitch = false;
  var name = UserPreferences.getName();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'My Profile',
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: kColorGrey,
      body: ListView(padding: EdgeInsets.symmetric(vertical: 30), children: [
        SizedBox(
          height: 3.h,
        ),
        ClipOval(
            child: Image.asset(
          'assets/images/profile.jpg',
          height: 80,
          width: 80,
        )),
        SizedBox(
          height: 1.h,
        ),
        Center(
            child: CustomText(
          text: '$name',
          fontSize: 16.sp,
          weight: FontWeight.w500,
        )),
        Divider(
          color: Colors.grey,
        ),
        SizedBox(
          height: 1.5.h,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyReports();
            }));
          },
          child: ProfileRow(
            icon: Icons.list_alt,
            title: 'My Reports',
            widget: SizedBox(),
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FeedbackPage();
            }));
          },
          child: ProfileRow(
            icon: Icons.feedback_outlined,
            title: 'Feedback',
            widget: SizedBox(),
          ),
        ),
        SizedBox(
          height: 1.5.h,
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
                                    onTap: () async {
                                      UserPreferences.logout();
                                      var sp =
                                          await SharedPreferences.getInstance();
                                      sp.remove('NAME');
                                      sp.remove('EMAIL');
                                      sp.remove('PHONE');

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
            islogout: true,
            widget: SizedBox(),
          ),
        ),
      ]),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final icon, title, islogout;
  final Widget? widget;
  const ProfileRow(
      {Key? key,
      required this.icon,
      required this.title,
      this.islogout = false,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [shadow]),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: islogout == true ? Colors.red : Colors.blue,
              ),
              SizedBox(
                width: 16,
              ),
              CustomText(
                text: title,
                fontSize: 11.sp,
                color: islogout == true ? Colors.red : Colors.black,
                weight: FontWeight.w400,
              ),
            ],
          ),
          widget!
        ],
      ),
    );
  }
}
