import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/Extracted%20Widgets/custom_text.dart';
import 'package:fyp/SharedPreference/sharedPreference.dart';
import 'package:fyp/UI/Screens/appointment.dart';
import 'package:fyp/UI/Screens/news.dart';
import 'package:fyp/UI/Services/consultation.dart';
import 'package:fyp/UI/Services/pharmacy.dart';
import 'package:fyp/UI/Services/services.dart';
import 'package:fyp/UI/loginandsignup/login.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/const.dart';
import '../../Services/Model/news_model.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = UserPreferences.getName();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.blue.shade100,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.blue.shade100,
                  Colors.white,
                ],
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text:
                              '${DateFormat('E , d MMM').format(DateTime.now())}',
                          fontSize: 17.sp,
                        ),
                        CustomText(
                          text: 'Welcome! $name',
                          fontSize: 17.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/bro.png',
                      scale: 7,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Our Services',
                        fontSize: 12.sp,
                        weight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 15.h,
                        child: ListView(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          scrollDirection: Axis.horizontal,
                          children: [
                            ServicesWidget(
                              icon: 'assets/images/doctor.png',
                              title: 'Consultation',
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Consultation();
                                }));
                              },
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            ServicesWidget(
                              icon: 'assets/images/appointment.png',
                              title: 'Appointments',
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Appointment();
                                }));
                              },
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            ServicesWidget(
                              icon: 'assets/images/pharmacy.png',
                              title: 'Pharmacy',
                              scale: 1.5,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Pharmacy();
                                }));
                              },
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            ServicesWidget(
                              icon: 'assets/images/pharmacy.png',
                              title: 'Other Services',
                              scale: 1.5,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return OtherServices();
                                    }));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [shadow],
                          
                        ),
                        child: Column(
                          children: [
                            CustomText(text: 'View the latest News'),
                            SizedBox(height: 1.5.h),
                            LoginButton(text: 'See News', color: Colors.blue, onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){return NewsPage();}));
                            })
                          ],
                        ),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ServicesWidget extends StatelessWidget {
  final icon, title, scale, onTap;
  const ServicesWidget(
      {Key? key, this.icon, this.title, this.scale, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 12.h,
        width: 26.w,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.blue.shade200, Colors.white], radius: 0.9
                // begin: Alignment.bottomCenter,
                // end: Alignment.topCenter
                ),
            // color: Colors.blue.shade200.withOpacity(0.2),
            border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [shadow]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                icon,
                scale: scale,
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomText(
                text: title,
                fontSize: 9.sp,
                textAlign: TextAlign.center,
              )
            ]),
      ),
    );
  }
}
