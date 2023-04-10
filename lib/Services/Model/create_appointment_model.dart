// To parse this JSON data, do
//
//     final createAppointmentModel = createAppointmentModelFromJson(jsonString);

import 'dart:convert';

CreateAppointmentModel createAppointmentModelFromJson(String str) =>
    CreateAppointmentModel.fromJson(json.decode(str));

String createAppointmentModelToJson(CreateAppointmentModel data) =>
    json.encode(data.toJson());

class CreateAppointmentModel {
  CreateAppointmentModel({
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
    required this.charge,
    required this.userId,
    required this.id,
    required this.v,
  });

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
  String charge;
  String userId;
  String id;
  int v;

  factory CreateAppointmentModel.fromJson(Map<String, dynamic> json) =>
      CreateAppointmentModel(
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
        charge: json["charge"],
        userId: json["userId"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
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
        "charge": charge,
        "userId": userId,
        "_id": id,
        "__v": v,
      };
}
