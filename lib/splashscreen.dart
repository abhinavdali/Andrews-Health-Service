import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp/SharedPreference/sharedPreference.dart';
import 'package:fyp/UI/Screens/dashboard.dart';
import 'package:fyp/UI/loginandsignup/welcome.dart';
import 'package:sizer/sizer.dart';

import 'UI/Screens/botnav.dart';
import 'UI/loginandsignup/login.dart';

String? finalToken;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidation().whenComplete(() => Timer(Duration(seconds: 3), () {
          finalToken == null
              ? Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                  return Welcome();
                }), (route) => false)
              : Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                  return BottomBar();
                }), (route) => false);
        }));
  }

  Future getValidation() async {
    var token = await UserPreferences.getToken();
    print(token);
    setState(() {
      finalToken = token;
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
