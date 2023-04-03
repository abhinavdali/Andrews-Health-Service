part of 'doctor_bloc.dart';

@immutable
abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final DoctorModel doctorModel;
  DoctorLoaded({required this.doctorModel});
}

class DoctorError extends DoctorState {}
