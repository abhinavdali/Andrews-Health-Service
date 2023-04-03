import 'package:flutter/material.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/custom_text.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorGrey,
      appBar: AppBar(
        title: CustomText(
          text: 'My Favourites',
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
