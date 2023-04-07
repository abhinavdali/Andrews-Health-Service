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
                  itemCount: def.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [shadow],
                      ),
                      child: Column(
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
                            Row(children: [
                              
                            ],)
                          ]),
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
