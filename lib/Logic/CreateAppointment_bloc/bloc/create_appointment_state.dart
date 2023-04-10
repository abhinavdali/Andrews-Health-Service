part of 'create_appointment_bloc.dart';

@immutable
abstract class CreateAppointmentState {}

class CreateAppointmentInitial extends CreateAppointmentState {}

class CreateAppointmentLoading extends CreateAppointmentState {}

class CreateAppointmentLoaded extends CreateAppointmentState {
  final CreateAppointmentModel createAppointmentModel;
  CreateAppointmentLoaded({required this.createAppointmentModel});
}

class CreateAppointmentError extends CreateAppointmentState {}
