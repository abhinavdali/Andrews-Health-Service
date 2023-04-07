import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final controller,
      maxLines,
      validator,
      prefix,
      isPass,
      hintText,
      textInputAction,
      keyboardType,
      onPress,
      enabled;
  const CustomTextField(
      {Key? key,
      required this.controller,
      this.enabled = true,
      this.onPress,
      this.maxLines = 1,
      this.validator,
      this.prefix,
      this.isPass = false,
      this.hintText,
      this.textInputAction,
      this.keyboardType})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

bool isHidden = true;

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.055,
      child: GestureDetector(
        onTap: widget.onPress,
        child: TextFormField(
          enabled: widget.enabled,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          validator: widget.validator,
          maxLines: widget.maxLines,
          obscureText: widget.isPass ? (isHidden ? true : false) : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,

            fillColor: const Color(0xFFEDEDED),
            prefixIcon: widget.prefix,
            hintStyle: TextStyle(fontSize: 10.sp),
            suffixIcon: widget.isPass == false
                ? null
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                    child: Icon(
                      isHidden ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                      size: 20,
                    )),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            // enabledBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(12),
            //     borderSide: BorderSide(color: Colors.grey, width: 1)),
            // focusedBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(12),
            //     borderSide: BorderSide(color: Colors.blue, width: 1)),
            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(12),
            //   borderSide: BorderSide(color: Colors.red, width: 1),
            // ),
            // disabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(12),
            //   borderSide: BorderSide(color: Colors.grey, width: 1),
            // ),
            // focusedErrorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(12),
            //   borderSide: BorderSide(color: Colors.blue, width: 1),
            // )
          ),
        ),
      ),
    );
  }
}
