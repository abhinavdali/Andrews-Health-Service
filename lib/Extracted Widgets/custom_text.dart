import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double hpadding;
  final double vpadding;
  double? fontSize = 12.sp;
  final FontWeight? weight;
  final Color? color;
  final String? family;
  final textAlign;

  CustomText(
      {required this.text,
      this.fontSize,
      this.hpadding = 0,
      this.vpadding = 0,
      this.weight = FontWeight.w400,
      this.color = CupertinoColors.label,
      this.family = 'NunitoSans',
      this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: hpadding, vertical: vpadding),
        child: Text(
          text,
        ),
      ),
      style: TextStyle(
        fontFamily: family,
        fontSize: fontSize,
        color: color,
        fontWeight: weight,
      ),
      textAlign: textAlign,
    );
  }
}
