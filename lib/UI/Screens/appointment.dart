import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/custom_text.dart';
import 'package:fyp/UI/Screens/create_appointment.dart';
import 'package:sizer/sizer.dart';

import '../../Logic/Appointment_bloc/bloc/appointment_bloc.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<AppointmentBloc>(context).add(OnAppointmentLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorGrey,
        appBar: AppBar(
          title: CustomText(
            text: 'My Appoinments',
            color: Colors.white,
            weight: FontWeight.w600,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CreateAppointment();
            }));
          },
          child: Icon(Icons.add),
        ),
        body: BlocBuilder<AppointmentBloc, AppointmentState>(
            builder: (context, state) {
          if (state is AppointmentInitial) {
          } else if (state is AppointmentLoading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is AppointmentLoaded) {
            var def = state.appointmentModel.appointment;
            if (def.isNotEmpty) {
              return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 16.0),
                  itemCount: def.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [shadow],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: '${def[i].doctorName}',
                                    fontSize: 12.sp,
                                    weight: FontWeight.w600,
                                  ),
                                  CustomText(
                                    text: '${def[i].department}',
                                    fontSize: 9.sp,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.calendar,
                                            size: 17,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          CustomText(
                                              fontSize: 9.sp,
                                              text:
                                                  '${def[i].appointmentDate.toString().substring(0, def[i].appointmentDate.toString().indexOf(' '))}')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.3.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.healing_outlined,
                                            size: 17,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          CustomText(
                                              fontSize: 9.sp,
                                              text: '${def[i].instructions}')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.3.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.personal_injury_outlined,
                                            size: 17,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          CustomText(
                                              fontSize: 9.sp,
                                              text: '${def[i].patientName}')
                                        ],
                                      )
                                    ],
                                  )
                                ]),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'You have no appoinments at the moment.'),
                    SizedBox(
                      height: 1.h,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CreateAppointment();
                          }));
                        },
                        child: CustomText(
                          text: 'Book Appoinment',
                          color: Colors.white,
                        ))
                  ],
                ),
              );
            }
          } else if (state is AppointmentError) {}
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }));
  }
}
