import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const kColorGrey = Color(0xffF3EFF5);

var shadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2), spreadRadius: 2, blurRadius: 2);

SnackBar CustomSnackBar(message, color, icon, bottomText) => SnackBar(
      content: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'NotoSansReg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      bottomText,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: 'NotoSansReg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: color,
      duration: Duration(seconds: 2),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
    );

void showSnackBar(BuildContext context, String message, Color color,
    IconData icon, String bottomText) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    CustomSnackBar(message, color, icon, bottomText),
  );
}
