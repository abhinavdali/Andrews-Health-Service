import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/SharedPreference/sharedPreference.dart';
import 'package:fyp/UI/Screens/botnav.dart';
import 'package:fyp/UI/loginandsignup/signup.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/const.dart';
import '../../Extracted Widgets/custom_text.dart';
import '../../Extracted Widgets/textfield.dart';
import '../../Logic/Login_bloc/login_bloc.dart';
import '../Screens/dashboard.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          // TODO: implement listener}
          if (state is LoginLoaded) {
            print('success');
            if (state.loginModel.token.isNotEmpty) {
              print(state.loginModel.token);
              UserPreferences.setToken(state.loginModel.token);

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return BottomBar();
              }));

              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return Dashboard();
              // }));
            }
          }
          if (state is LoginLoading) {
            showDialog(
                barrierDismissible: false,
                barrierColor: Colors.grey.withOpacity(0.2),
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    content: Container(
                      height: 90,
                      width: 170,
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
          if (state is LoginError) {
            Navigator.pop(context);
            print('fail');
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
            padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/andrews_health_logo.png',
                            height: 200,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomText(
                          text: 'Login',
                          fontSize: 19.sp,
                          weight: FontWeight.w800,
                        ),
                        SizedBox(
                          height: 1.7.h,
                        ),
                        // CustomText(text: 'Email'),
                        // SizedBox(
                        //   height: 0.7.h,
                        // ),
                        CustomTextField(
                          hintText: 'Email',
                          controller: emailController,
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
                        SizedBox(
                          height: 1.h,
                        ),
                        // CustomText(text: 'Password'),
                        // SizedBox(
                        //   height: 0.7.h,
                        // ),
                        CustomTextField(
                          isPass: true,
                          hintText: 'Password',
                          controller: passwordController,
                          prefix: Icon(
                            Icons.lock_outline_sharp,
                            size: 20,
                          ),
                          validator: (value) {
                            if (passwordController.text.isEmpty) {
                              return 'Please enter your password';
                            }
                          },
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        LoginButton(
                          color: Colors.blue,
                          text: 'LOGIN',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<LoginBloc>(context).add(OnLogin(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text: 'Haven\'t signed up yet? ',
                              color: Colors.grey[600],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SignUp();
                                }));
                              },
                              child: CustomText(
                                text: 'Sign Up',
                                color: Colors.blue,
                                weight: FontWeight.w600,
                              ),
                            ),
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

class LoginButton extends StatelessWidget {
  final color, text, onTap, textColor;

  const LoginButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.onTap,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.6.h,
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
          onPressed: onTap,
          child: CustomText(
            text: text,
            color: textColor,
          )),
    );
  }
}
