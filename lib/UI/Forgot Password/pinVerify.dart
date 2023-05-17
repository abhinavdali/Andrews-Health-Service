import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Logic/OTP_bloc/bloc/otp_bloc.dart';
import 'package:fyp/UI/Forgot%20Password/resetPassword.dart';
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
  final TextEditingController otpController = TextEditingController();
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
      body: BlocListener<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state is OtpLoading) {
            showDialog(
                barrierDismissible: false,
                barrierColor: Colors.grey.withOpacity(0.2),
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    content: Container(
                      height: 80,
                      width: 150,
                      child: Column(
                        children: [
                          CustomText(text: 'Please Wait'),
                          SizedBox(
                            height: 2.h,
                          ),
                          CircularProgressIndicator()
                        ],
                      ),
                    ),
                  );
                });
          }
          if (state is OtpLoaded) {
            Navigator.pop(context);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResetPassword(
                email: widget.email,
              );
            }));
          }
          if (state is OtpError) {
            Navigator.pop(context);
            print('error');
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text:
                        'An email has been sent to\n ${widget.email}  with the OTP.',
                    textAlign: TextAlign.center,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Form(
                    key: _formKey,
                    child: CustomTextField(
                      controller: otpController,
                      hintText: 'Your Pin',
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      prefix: Icon(
                        Icons.pin,
                        size: 20,
                      ),
                      validator: (value) {
                        if (otpController.text.isEmpty) {
                          return 'Please enter your OTP';
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            LoginButton(
                text: 'SEND',
                color: Colors.blue,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<OtpBloc>(context).add(OnOTPSent(
                        email: widget.email,
                        OTP: int.parse(otpController.text)));
                  }
                }),
            SizedBox(
              height: 2.h,
            )
          ]),
        ),
      ),
    );
  }
}
