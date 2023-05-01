import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/textfield.dart';
import 'package:fyp/Logic/Feedback_bloc/feedback_bloc.dart';
import 'package:fyp/SharedPreference/sharedPreference.dart';
import 'package:fyp/UI/Screens/botnav.dart';
import 'package:fyp/UI/loginandsignup/login.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  var email = UserPreferences.getEmail();
  var phone = UserPreferences.getPhone();
  var name = UserPreferences.getName();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = email!;
    phoneController.text = phone!;
    nameController.text = name!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: CustomText(
          text: 'Feedback',
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: kColorGrey,
      body: BlocListener<FeedbackBloc, FeedbackState>(
  listener: (context, state) {
    if(state is FeedbackLoading){
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
    if(state is FeedbackLoaded){
      Navigator.pop(context);
      showDialog(
          barrierDismissible: false,
          barrierColor: Colors.grey.withOpacity(0.2),
          context: context,
          builder: (builder) {
            return AlertDialog(
              contentPadding: EdgeInsets.symmetric(vertical: 24,horizontal: 26),
              content: Container(
                height: 80,
                width: 150,
                child: Column(
                  children: [
                    CustomText(text: 'Your Feedback has been submitted!',weight: FontWeight.w600,fontSize: 12.sp,),
                    SizedBox(
                      height: 2.h,
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){return BottomBar();}));
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
    if(state is FeedbackError){
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
                    CustomText(text: 'Could not send feeback',weight: FontWeight.w600,fontSize: 12.sp,),
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
  child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              CustomText(text: 'Send Us Your Feedback!',color: Colors.black,weight: FontWeight.w600,),
              SizedBox(height: 2.h,),
              CustomTextField(controller: nameController,fillColor: Colors.white, validator: (value) {
                if (nameController.text.isEmpty) {
                  return 'Please enter your name';
                }
              },),
              SizedBox(height: 1.5.h,),
              CustomTextField(controller: emailController,fillColor: Colors.white,validator: (value) {
                if (emailController.text.isEmpty) {
                  return 'Please enter an email';
                } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(emailController.text)) {
                  return 'Please enter a valid email address';
                }
              },),
              SizedBox(height:1.5.h,),
              CustomTextField(controller: phoneController,fillColor: Colors.white,keyboardType: TextInputType.phone,  validator: (value) {
                if (phoneController.text.isEmpty) {
                  return 'Please enter your phone number';
                }
              },),
              SizedBox(height:1.5.h,),
              CustomTextField(controller: messageController,fillColor: Colors.white,maxLines: 8,hintText: 'Message',vPadding: 16.0,  validator: (value) {
                if (messageController.text.isEmpty) {
                  return 'Please enter a message';
                }
              },),
              SizedBox(height:3.h,),
              LoginButton(text: 'SEND FEEDBACK', color: Colors.blue, onTap: (){
                if(_formKey.currentState!.validate()){
                  BlocProvider.of<FeedbackBloc>(context).add(OnFeedbackMade(name: nameController.text, phone: phoneController.text, email: emailController.text, message: messageController.text));
                }
              })
            ],),
          ),
        ),
      ),
),
    );
  }
}
