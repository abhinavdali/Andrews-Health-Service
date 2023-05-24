// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

ReportModel reportModelFromJson(String str) => ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) => json.encode(data.toJson());

class ReportModel {
  List<Report> report;

  ReportModel({
    required this.report,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
    report: List<Report>.from(json["report"].map((x) => Report.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "report": List<dynamic>.from(report.map((x) => x.toJson())),
  };
}

class Report {
  String id;
  String patientName;
  String age;
  String sex;
  String symtomps;
  String prescriptions;
  DateTime date;
  String user;
  int v;

  Report({
    required this.id,
    required this.patientName,
    required this.age,
    required this.sex,
    required this.symtomps,
    required this.prescriptions,
    required this.date,
    required this.user,
    required this.v,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    id: json["_id"],
    patientName: json["patientName"],
    age: json["age"],
    sex: json["sex"],
    symtomps: json["symtomps"],
    prescriptions: json["prescriptions"],
    date: DateTime.parse(json["date"]),
    user: json["user"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "patientName": patientName,
    "age": age,
    "sex": sex,
    "symtomps": symtomps,
    "prescriptions": prescriptions,
    "date": date.toIso8601String(),
    "user": user,
    "__v": v,
  };
}
