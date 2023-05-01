// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  List<Doctor> doctors;

  DoctorModel({
    required this.doctors,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    doctors: List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
  };
}

class Doctor {
  String id;
  String name;
  String phone;
  String designation;
  String department;
  String timing;
  String education;
  bool availability;
  int v;
  UploadedFile uploadedFile;
  List<String> favorites;
  String? description;

  Doctor({
    required this.id,
    required this.name,
    required this.phone,
    required this.designation,
    required this.department,
    required this.timing,
    required this.education,
    required this.availability,
    required this.v,
    required this.uploadedFile,
    required this.favorites,
    this.description,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["_id"],
    name: json["name"],
    phone: json["phone"],
    designation: json["designation"],
    department: json["department"],
    timing: json["timing"],
    education: json["education"],
    availability: json["availability"],
    v: json["__v"],
    uploadedFile: UploadedFile.fromJson(json["uploadedFile"]),
    favorites: List<String>.from(json["favorites"].map((x) => x)),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "phone": phone,
    "designation": designation,
    "department": department,
    "timing": timing,
    "education": education,
    "availability": availability,
    "__v": v,
    "uploadedFile": uploadedFile.toJson(),
    "favorites": List<dynamic>.from(favorites.map((x) => x)),
    "description": description,
  };
}

class UploadedFile {
  String path;
  String type;
  int size;
  String folder;
  String filename;
  String id;

  UploadedFile({
    required this.path,
    required this.type,
    required this.size,
    required this.folder,
    required this.filename,
    required this.id,
  });

  factory UploadedFile.fromJson(Map<String, dynamic> json) => UploadedFile(
    path: json["path"],
    type: json["type"],
    size: json["size"],
    folder: json["folder"],
    filename: json["filename"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "type": type,
    "size": size,
    "folder": folder,
    "filename": filename,
    "_id": id,
  };
}
