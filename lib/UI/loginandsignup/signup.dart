import 'package:flutter/material.dart';
import 'package:fyp/UI/loginandsignup/login.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';
import '../../Extracted Widgets/textfield.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/signbg.png'),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 27, 16, 0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Sign Up',
                      fontSize: 18.sp,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      hintText: 'Full Name',
                      controller: fullNameController,
                      prefix: Icon(
                        Icons.person_outline_outlined,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: 1.3.h,
                    ),
                    CustomTextField(
                        hintText: 'Email',
                        prefix: Icon(
                          Icons.email_outlined,
                          size: 20,
                        ),
                        controller: emailController),
                    SizedBox(
                      height: 1.3.h,
                    ),
                    CustomTextField(
                        hintText: 'Phone Number',
                        prefix: Icon(
                          Icons.phone_outlined,
                          size: 20,
                        ),
                        controller: phoneController),
                    SizedBox(
                      height: 1.3.h,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      prefix: Icon(
                        Icons.lock_outline,
                        size: 20,
                      ),
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
                      controller: confirmPassController,
                      isPass: true,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    LoginButton(
                      text: 'CONFIRM',
                      color: Colors.blue,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: 'Already have an account?'),
                        GestureDetector(
                            onTap: () {},
                            child: CustomText(
                              text: ' Log In',
                              color: Colors.blue,
                            ))
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
