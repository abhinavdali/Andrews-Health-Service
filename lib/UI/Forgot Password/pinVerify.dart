import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';
import '../../Extracted Widgets/textfield.dart';
import '../../Logic/VerifyEmail_bloc/bloc/verify_email_bloc.dart';
import '../loginandsignup/login.dart';

class PinVerify extends StatefulWidget {
  final String email;
  const PinVerify({super.key, required this.email});

  @override
  State<PinVerify> createState() => _PinVerifyState();
}

class _PinVerifyState extends State<PinVerify> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: CustomText(
          text: 'Verify Email',
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text:
                      'An email has been sent to\n ${widget.email}  with the OTP',
                  textAlign: TextAlign.center,
                  color: Colors.grey.shade700,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Form(
                  key: _formKey,
                  child: CustomTextField(
                    controller: emailController,
                    hintText: 'Your Pin',
                    keyboardType: TextInputType.number,
                    prefix: Icon(
                      Icons.pin,
                      size: 20,
                    ),
                    validator: (value) {
                      if (emailController.text.isEmpty) {
                        return 'Please enter an email';
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          LoginButton(
              text: 'Verify Email',
              color: Colors.blue,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<VerifyEmailBloc>(context)
                      .add(OnEmailVerify(email: emailController.text));
                }
              }),
          SizedBox(
            height: 2.h,
          )
        ]),
      ),
    );
  }
}
