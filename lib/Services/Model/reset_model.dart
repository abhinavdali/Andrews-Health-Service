// To parse this JSON data, do
//
//     final resetModel = resetModelFromJson(jsonString);

import 'dart:convert';

ResetModel resetModelFromJson(String str) =>
    ResetModel.fromJson(json.decode(str));

String resetModelToJson(ResetModel data) => json.encode(data.toJson());

class ResetModel {
  String message;

  ResetModel({
    required this.message,
  });

  factory ResetModel.fromJson(Map<String, dynamic> json) => ResetModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
