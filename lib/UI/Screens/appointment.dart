import 'package:flutter/material.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/custom_text.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorGrey,
      appBar: AppBar(
        title: CustomText(
          text: 'My Appoinments',
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
