// To parse this JSON data, do
//
//     final verifyEmailModel = verifyEmailModelFromJson(jsonString);

import 'dart:convert';

VerifyEmailModel verifyEmailModelFromJson(String str) =>
    VerifyEmailModel.fromJson(json.decode(str));

String verifyEmailModelToJson(VerifyEmailModel data) =>
    json.encode(data.toJson());

class VerifyEmailModel {
  String data;

  VerifyEmailModel({
    required this.data,
  });

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) =>
      VerifyEmailModel(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
