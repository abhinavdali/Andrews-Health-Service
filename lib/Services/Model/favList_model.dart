// To parse this JSON data, do
//
//     final favListModel = favListModelFromJson(jsonString);

import 'dart:convert';

FavListModel favListModelFromJson(String str) => FavListModel.fromJson(json.decode(str));

String favListModelToJson(FavListModel data) => json.encode(data.toJson());

class FavListModel {
  List<Record> records;

  FavListModel({
    required this.records,
  });

  factory FavListModel.fromJson(Map<String, dynamic> json) => FavListModel(
    records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
  };
}

class Record {
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

  Record({
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
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
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
