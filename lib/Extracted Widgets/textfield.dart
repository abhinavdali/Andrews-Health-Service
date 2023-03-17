import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final controller, maxLines, validator, prefix, isPass;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.maxLines = 1,
    this.validator,
    this.prefix,
    this.isPass = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

bool isHidden = true;

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.055,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        maxLines: widget.maxLines,
        obscureText: widget.isPass ? (isHidden ? true : false) : false,
        decoration: InputDecoration(
            prefixIcon: widget.prefix,
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
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: Colors.grey, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: Colors.blue, width: 1)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.blue, width: 1),
            )),
      ),
    );
  }
}
