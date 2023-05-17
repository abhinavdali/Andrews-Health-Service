import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/textfield.dart';
import 'package:fyp/Logic/Reset_bloc/bloc/reset_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';
import '../loginandsignup/login.dart';

class ResetPassword extends StatefulWidget {
  final email;
  const ResetPassword({super.key, this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: CustomText(
          text: 'Reset Password',
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocListener<ResetBloc, ResetState>(
        listener: (context, state) {
          if (state is ResetLoading) {
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
          if (state is ResetLoaded) {
            Navigator.pop(context);
            showSnackBar(context, 'Success', Colors.green, Icons.check,
                'Your password has been reset successfully');
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Login();
            }));
          }
          if (state is ResetError) {
            Navigator.pop(context);
            print('error');
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Set Your New Password',
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextField(
                        hintText: 'Password',
                        prefix: Icon(
                          Icons.lock_outline,
                          size: 20,
                        ),
                        validator: (value) {
                          if (passController.text.isEmpty) {
                            return 'Please enter your password';
                          }
                        },
                        controller: passController,
                        isPass: true,
                      ),
                      SizedBox(
                        height: 1.3.h,
                      ),
                      CustomTextField(
                        hintText: 'Confirm Password',
                        prefix: Icon(
                          Icons.lock_outline,
                          size: 20,
                        ),
                        validator: (value) {
                          if (confirmPassController.text.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (passController.text !=
                              confirmPassController.text) {
                            return 'Password doesn\'t match';
                          }
                        },
                        controller: confirmPassController,
                        isPass: true,
                      ),
                    ],
                  ),
                ),
              ),
              LoginButton(
                  text: 'Update Password',
                  color: Colors.blue,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<ResetBloc>(context).add(OnReset(
                          email: widget.email,
                          password: confirmPassController.text));
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
