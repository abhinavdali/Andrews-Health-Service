import 'package:flutter/material.dart';
import 'package:fyp/UI/loginandsignup/login.dart';
import 'package:fyp/UI/loginandsignup/signup.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // CustomText(
              //   text: 'Andrews Health Service',
              //   fontSize: 18.sp,
              // ),
              Image.asset(
                'assets/images/andrews_health_logo.png',
                height: 200,
                width: 500,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Image.asset(
                'assets/images/illustration.png',
                scale: 1,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        CustomText(
          text: 'Manage your health and \nhappy future',
          weight: FontWeight.w700,
          fontSize: 15.sp,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 2)
                ]),
            child: LoginButton(
              text: 'LOGIN',
              color: Colors.blue,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              },
            )),
        SizedBox(
          height: 1.5.h,
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 2)
                ]),
            child: LoginButton(
              text: 'SIGN UP',
              color: Colors.white,
              textColor: Colors.blue,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUp();
                }));
              },
            )),
      ]),
    );
  }
}
