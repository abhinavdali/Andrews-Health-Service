// To parse this JSON data, do
//
//     final appointmentModel = appointmentModelFromJson(jsonString);

import 'dart:convert';

AppointmentModel appointmentModelFromJson(String str) =>
    AppointmentModel.fromJson(json.decode(str));

String appointmentModelToJson(AppointmentModel data) =>
    json.encode(data.toJson());

class AppointmentModel {
  AppointmentModel({
    required this.appointment,
  });

  List<Appointment> appointment;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        appointment: List<Appointment>.from(
            json["appointment"].map((x) => Appointment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "appointment": List<dynamic>.from(appointment.map((x) => x.toJson())),
      };
}

class Appointment {
  Appointment({
    required this.id,
    required this.department,
    required this.doctorName,
    required this.patientName,
    required this.phone,
    required this.gender,
    required this.age,
    required this.city,
    required this.address,
    required this.appointmentDate,
    required this.instructions,
    required this.userId,
    required this.v,
  });

  String id;
  String department;
  String doctorName;
  String patientName;
  String phone;
  String gender;
  String age;
  String city;
  String address;
  DateTime appointmentDate;
  String instructions;
  String userId;
  int v;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["_id"],
        department: json["department"],
        doctorName: json["doctorName"],
        patientName: json["patientName"],
        phone: json["phone"],
        gender: json["gender"],
        age: json["age"],
        city: json["city"],
        address: json["address"],
        appointmentDate: DateTime.parse(json["appointmentDate"]),
        instructions: json["instructions"],
        userId: json["userId"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "department": department,
        "doctorName": doctorName,
        "patientName": patientName,
        "phone": phone,
        "gender": gender,
        "age": age,
        "city": city,
        "address": address,
        "appointmentDate": appointmentDate.toIso8601String(),
        "instructions": instructions,
        "userId": userId,
        "__v": v,
      };
}
