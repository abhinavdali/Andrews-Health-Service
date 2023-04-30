
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:fyp/Services/Model/create_appointment_model.dart';
import 'package:meta/meta.dart';

part 'create_appointment_event.dart';
part 'create_appointment_state.dart';

class CreateAppointmentBloc
    extends Bloc<CreateAppointmentEvent, CreateAppointmentState> {
  final ApiRepository apiRepository;
  CreateAppointmentBloc({required this.apiRepository})
      : super(CreateAppointmentInitial()) {
    on<OnCreateAppointment>((event, emit) async {
      emit(CreateAppointmentInitial());
      try {
        emit(CreateAppointmentLoading());
        var data = await apiRepository.postAppointment(
            event.name,
            event.phone,
            event.gender,
            event.age,
            event.city,
            event.address,
            event.doctorName,
            event.designation,
            event.instructions,
            event.appointmentDate);
        emit(CreateAppointmentLoaded(createAppointmentModel: data));
      } catch (e) {
        print(e);
        emit(CreateAppointmentError());
      }
    });
  }
}
