import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final controller,
      maxLines,
      maxLength,
      validator,
      prefix,
      isPass,
      hintText,
      textInputAction,
      keyboardType,
      onPress,
      fillColor,
      onChange,
      vPadding,
      enabled;
  const CustomTextField(
      {Key? key,
      required this.controller,
      this.enabled = true,
      this.onPress,
      this.maxLines = 1,
      this.maxLength,
      this.validator,
      this.prefix,
      this.isPass = false,
      this.hintText,
      this.vPadding = 0.0,
      this.onChange,
      this.fillColor = const Color(0xFFEDEDED),
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
          onChanged: widget.onChange,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          validator: widget.validator,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          obscureText: widget.isPass ? (isHidden ? true : false) : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            counterText: '',
            filled: true,

            fillColor: widget.fillColor,
            prefixIcon: widget.prefix,
            hintStyle: TextStyle(fontSize: 10.sp, color: Colors.grey.shade700),
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
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: widget.vPadding),
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
