// To parse this JSON data, do
//
//     final designationModel = designationModelFromJson(jsonString);

import 'dart:convert';

DesignationModel designationModelFromJson(String str) => DesignationModel.fromJson(json.decode(str));

String designationModelToJson(DesignationModel data) => json.encode(data.toJson());

class DesignationModel {
  List<Designation> designation;

  DesignationModel({
    required this.designation,
  });

  factory DesignationModel.fromJson(Map<String, dynamic> json) => DesignationModel(
    designation: List<Designation>.from(json["designation"].map((x) => Designation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "designation": List<dynamic>.from(designation.map((x) => x.toJson())),
  };
}

class Designation {
  String id;
  String name;
  int v;

  Designation({
    required this.id,
    required this.name,
    required this.v,
  });

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
    id: json["_id"],
    name: json["name"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "__v": v,
  };
}
