// To parse this JSON data, do
//
//     final pharmacyModel = pharmacyModelFromJson(jsonString);

import 'dart:convert';

PharmacyModel pharmacyModelFromJson(String str) =>
    PharmacyModel.fromJson(json.decode(str));

String pharmacyModelToJson(PharmacyModel data) => json.encode(data.toJson());

class PharmacyModel {
  PharmacyModel({
    this.pharmacy,
  });

  List<Pharmacy>? pharmacy;

  factory PharmacyModel.fromJson(Map<String, dynamic> json) => PharmacyModel(
        pharmacy: List<Pharmacy>.from(
            json["pharmacy"].map((x) => Pharmacy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pharmacy": List<dynamic>.from(pharmacy!.map((x) => x.toJson())),
      };
}

class Pharmacy {
  Pharmacy({
    this.id,
    this.medicineName,
    this.expiryDate,
    this.description,
    this.price,
    this.v,
    this.uploadedFile,
  });

  String? id;
  String? medicineName;
  String? expiryDate;
  String? description;
  String? price;
  int? v;
  UploadedFile? uploadedFile;

  factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
        id: json["_id"],
        medicineName: json["medicineName"],
        expiryDate: json["expiryDate"],
        description: json["description"],
        price: json["price"],
        v: json["__v"],
        uploadedFile: UploadedFile.fromJson(json["uploadedFile"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "medicineName": medicineName,
        "expiryDate": expiryDate,
        "description": description,
        "price": price,
        "__v": v,
        "uploadedFile": uploadedFile?.toJson(),
      };
}

class UploadedFile {
  UploadedFile({
    this.path,
    this.type,
    this.size,
    this.folder,
    this.filename,
    this.id,
  });

  String? path;
  String? type;
  int? size;
  String? folder;
  String? filename;
  String? id;

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
