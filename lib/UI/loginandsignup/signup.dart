import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Extracted%20Widgets/snackbar.dart';
import 'package:fyp/UI/loginandsignup/login.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';
import '../../Extracted Widgets/textfield.dart';
import '../../Logic/SignUp_bloc/sign_up_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is SignUpLoaded) {
            print('success');
            if (state.signUpModel.token.isNotEmpty) {
              showSnackBar(context, 'Success', Colors.green, Icons.check,
                  'Account successfully created');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Login();
              }));
            }
          }
          if (state is SignUpLoading) {
            showDialog(
                barrierDismissible: false,
                barrierColor: Colors.grey.withOpacity(0.2),
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    content: Container(
                      height: 100,
                      width: 200,
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
          if (state is SignUpError) {
            Navigator.pop(context);
            showDialog(
                barrierDismissible: false,
                barrierColor: Colors.grey.withOpacity(0.2),
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.symmetric(vertical: 24,horizontal: 26),
                    content: Container(
                      height: 72,
                      width: 150,
                      child: Column(
                        children: [
                          CustomText(text: 'Invalid Credentials',weight: FontWeight.w600,fontSize: 12.sp,),
                          SizedBox(
                            height: 4.h,
                          ),

                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: double.infinity,
                              child: Center(child: CustomText(text: 'OK',color: Colors.blue,)),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
        },
        child: Container(
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
                child: Form(
                  key: formKey,
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
                          hintText: 'First Name',
                          controller: firstNameController,
                          prefix: Icon(
                            Icons.person_outline_outlined,
                            size: 20,
                          ),
                          validator: (value) {
                            if (firstNameController.text.isEmpty) {
                              return 'Please enter your first name';
                            }
                          },
                        ),
                        SizedBox(
                          height: 1.3.h,
                        ),
                        CustomTextField(
                          hintText: 'Last Name',
                          controller: lastNameController,
                          prefix: Icon(
                            Icons.person_outline_outlined,
                            size: 20,
                          ),
                          validator: (value) {
                            if (lastNameController.text.isEmpty) {
                              return 'Please enter your last name';
                            }
                          },
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
                            validator: (value) {
                              if (emailController.text.isEmpty) {
                                return 'Please enter an email';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(emailController.text)) {
                                return 'Please enter a valid email address';
                              }
                            },
                            controller: emailController),
                        SizedBox(
                          height: 1.3.h,
                        ),
                        CustomTextField(
                            keyboardType: TextInputType.phone,
                            hintText: 'Phone Number',
                            prefix: Icon(
                              Icons.phone_outlined,
                              size: 20,
                            ),
                            validator: (value) {
                              if (phoneController.text.isEmpty) {
                                return 'Please enter your phone number';
                              }
                            },
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
                        SizedBox(
                          height: 2.h,
                        ),
                        LoginButton(
                          text: 'CONFIRM',
                          color: Colors.blue,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SignUpBloc>(context).add(OnSignUp(
                                  fName: firstNameController.text,
                                  lName: lastNameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passController.text,
                                  confirm: confirmPassController.text));
                            }
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(text: 'Already have an account?'),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Login();
                                  }), (route) => false);
                                },
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
        ),
      ),
    );
  }
}
