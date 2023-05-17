import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Extracted%20Widgets/textfield.dart';
import 'package:fyp/Logic/VerifyEmail_bloc/bloc/verify_email_bloc.dart';
import 'package:fyp/UI/Forgot%20Password/pinVerify.dart';
import 'package:fyp/UI/loginandsignup/login.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
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
      body: BlocListener<VerifyEmailBloc, VerifyEmailState>(
        listener: (context, state) {
          if (state is VerifyEmailLoading) {
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
          if (state is VerifyEmailLoaded) {
            Navigator.pop(context);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PinVerify(
                email: emailController.text,
              );
            }));
          }
          if (state is VerifyEmailError) {
            Navigator.pop(context);
            showDialog(
                barrierDismissible: false,
                barrierColor: Colors.grey.withOpacity(0.2),
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 24, horizontal: 26),
                    content: Container(
                      height: 72,
                      width: 150,
                      child: Column(
                        children: [
                          CustomText(
                            text: state.message ?? 'Something went wrong',
                            weight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: double.infinity,
                              child: Center(
                                  child: CustomText(
                                text: 'OK',
                                color: Colors.blue,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text:
                            'Please enter your registered email address\nto verify your request',
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
                          hintText: 'Email address',
                          prefix: Icon(
                            Icons.email_outlined,
                            size: 20,
                          ),
                          validator: (value) {
                            if (emailController.text.isEmpty) {
                              return 'Please enter an email';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(emailController.text)) {
                              return 'Please enter a valid email address';
                            }
                          },
                        ),
                      )
                    ]),
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
            ],
          ),
        ),
      ),
    );
  }
}
