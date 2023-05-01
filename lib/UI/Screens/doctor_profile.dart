import 'package:flutter/material.dart';
import 'package:fyp/Extracted%20Widgets/custom_text.dart';
import 'package:fyp/UI/Screens/create_appointment.dart';
import 'package:fyp/UI/loginandsignup/login.dart';
import 'package:sizer/sizer.dart';

class DoctorProfile extends StatefulWidget {
  final name, designation, available,department,education;
  const DoctorProfile({super.key, this.name, this.designation, this.education,this.department, this.available});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: CustomText(
          text: 'Doctor Profile',
          weight: FontWeight.w700,
          color: Colors.white,
          fontSize: 12.sp,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.blue.shade100,
                Colors.white,
              ],
            )),
            child: Center(
              child: Image.asset(
                'assets/images/pana.png',
                scale: 7,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              image: DecorationImage(
                                image: AssetImage('assets/images/profile.jpg',),fit: BoxFit.fill

                              ),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        SizedBox(width: 2.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Dr. ${widget.name}',
                              weight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),

                            CustomText(
                              text: 'Available Hours: ${widget.available}',
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: 'Patients',
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            CustomText(
                              text: '400+',
                              color: Colors.greenAccent,
                              fontSize: 12.sp,
                              weight: FontWeight.w600,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Container(
                          height: 7.h,
                          width: 0.3.w,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: 'Experience',
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            CustomText(
                              text: '4 Years',
                              color: Colors.greenAccent,
                              fontSize: 12.sp,
                              weight: FontWeight.w600,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomText(
                      text: 'About Doctor',
                      fontSize: 12.sp,
                      weight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    CustomText(
                        text: 'Department: ${widget.department}',fontSize: 12.sp,
                    ),  SizedBox(
                      height: 1.h,
                    ),
                    CustomText(
                      text: 'Designation: ${widget.designation}',fontSize: 12.sp,
                    ),  SizedBox(
                      height: 1.h,
                    ),
                    CustomText(
                        text: 'Education: ${widget.education}',fontSize: 12.sp,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LoginButton(
                              text: 'MAKE APPOINTMENT',
                              color: Colors.blue,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){return CreateAppointment(name: widget.name,designation:widget.designation);}));
                              })
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
