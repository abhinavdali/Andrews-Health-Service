import 'package:flutter/material.dart';
import 'package:fyp/Extracted%20Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Doctor Profile',
          weight: FontWeight.w700,
          color: Colors.white,
          fontSize: 12.sp,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/pana.png',
              scale: 7,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Column(children: []),
            ),
          )
        ],
      ),
    );
  }
}
