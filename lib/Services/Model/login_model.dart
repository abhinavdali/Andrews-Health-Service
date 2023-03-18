// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.result,
    required this.token,
  });

  Result result;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.v,
  });

  String id;
  String name;
  String firstName;
  String lastName;
  String email;
  String password;
  String phone;
  int v;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    name: json["name"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "phone": phone,
    "__v": v,
  };
}
