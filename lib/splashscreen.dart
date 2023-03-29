import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp/SharedPreference/sharedPreference.dart';
import 'package:fyp/UI/Screens/dashboard.dart';
import 'package:sizer/sizer.dart';

import 'UI/Screens/botnav.dart';
import 'UI/loginandsignup/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      print(UserPreferences.getToken());

      UserPreferences.getToken() != null
          ? Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Login();
            }))
          : Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BottomBar();
            }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/andrews_health_logo.png',
            height: 200,
            width: 500,
          ),
          SizedBox(
            height: 2.h,
          ),
          SpinKitThreeBounce(
            color: Colors.blue,
            size: 25,
          )
        ],
      ),
    );
  }
}
