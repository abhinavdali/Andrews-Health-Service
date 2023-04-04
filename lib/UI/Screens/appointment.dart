import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/custom_text.dart';

import '../../Logic/Appointment_bloc/bloc/appointment_bloc.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

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
        body: BlocBuilder<AppointmentBloc, AppointmentState>(
            builder: (context, state) {
          if (state is AppointmentInitial) {
          } else if (state is AppointmentLoading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is AppointmentLoaded) {
          } else if (state is AppointmentError) {}
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }));
  }
}
