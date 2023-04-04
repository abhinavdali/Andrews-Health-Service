part of 'appointment_bloc.dart';

@immutable
abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentLoaded extends AppointmentState {
  final AppointmentModel appointmentModel;
  AppointmentLoaded({required this.appointmentModel});
}

class AppointmentError extends AppointmentState {}
