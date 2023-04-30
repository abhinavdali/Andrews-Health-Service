// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

import 'dart:convert';

ServicesModel servicesModelFromJson(String str) => ServicesModel.fromJson(json.decode(str));

String servicesModelToJson(ServicesModel data) => json.encode(data.toJson());

class ServicesModel {
  List<Service> services;

  ServicesModel({
    required this.services,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class Service {
  String id;
  String serviceName;
  String description;
  int v;
  UploadedFile uploadedFile;

  Service({
    required this.id,
    required this.serviceName,
    required this.description,
    required this.v,
    required this.uploadedFile,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["_id"],
    serviceName: json["serviceName"],
    description: json["description"],
    v: json["__v"],
    uploadedFile: UploadedFile.fromJson(json["uploadedFile"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceName": serviceName,
    "description": description,
    "__v": v,
    "uploadedFile": uploadedFile.toJson(),
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
