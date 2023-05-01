// To parse this JSON data, do
//
//     final feedbackModel = feedbackModelFromJson(jsonString);

import 'dart:convert';

FeedbackModel feedbackModelFromJson(String str) => FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
  NewFeedback newFeedback;

  FeedbackModel({
    required this.newFeedback,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
    newFeedback: NewFeedback.fromJson(json["newFeedback"]),
  );

  Map<String, dynamic> toJson() => {
    "newFeedback": newFeedback.toJson(),
  };
}

class NewFeedback {
  String name;
  String email;
  String phone;
  String message;
  String id;
  int v;

  NewFeedback({
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
    required this.id,
    required this.v,
  });

  factory NewFeedback.fromJson(Map<String, dynamic> json) => NewFeedback(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    message: json["message"],
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "message": message,
    "_id": id,
    "__v": v,
  };
}
