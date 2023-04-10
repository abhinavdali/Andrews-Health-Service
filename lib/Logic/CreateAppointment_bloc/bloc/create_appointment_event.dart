part of 'create_appointment_bloc.dart';

@immutable
abstract class CreateAppointmentEvent {}

class OnCreateAppointment extends CreateAppointmentEvent {
  final name,
      phone,
      gender,
      age,
      city,
      address,
      doctorName,
      designation,
      instructions,
      appointmentDate;

  OnCreateAppointment(
      {required this.name,
      required this.phone,
      required this.gender,
      required this.age,
      required this.city,
      required this.address,
      required this.doctorName,
      required this.designation,
      required this.instructions,
      required this.appointmentDate});
}
