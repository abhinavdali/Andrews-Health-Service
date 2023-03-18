// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.result,
    required this.token,
  });

  Result result;
  String token;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    result: Result.fromJson(json["result"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
    "token": token,
  };
}

class Result {
  Result({
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.id,
    required this.v,
  });

  String name;
  String firstName;
  String lastName;
  String email;
  String password;
  String phone;
  String id;
  int v;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "phone": phone,
    "_id": id,
    "__v": v,
  };
}
