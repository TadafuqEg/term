// To parse this JSON data, do
//
//     final languagesModel = languagesModelFromJson(jsonString);

import 'dart:convert';

LanguagesModel languagesModelFromJson(String str) => LanguagesModel.fromJson(json.decode(str));

String languagesModelToJson(LanguagesModel data) => json.encode(data.toJson());

class LanguagesModel {
  bool? success;
  String ?message;
  List<Datum>? data;
  String ?responseTime;

  LanguagesModel({
    this.success,
    this.message,
    this.data,
    this.responseTime,
  });

  factory LanguagesModel.fromJson(Map<String, dynamic> json) => LanguagesModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    responseTime: json["response_time"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "response_time": responseTime,
  };
}

class Datum {
  String ?code;
  int ?id;
  String ?name;

  Datum({
    this.code,
    this.id,
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    code: json["code"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "id": id,
    "name": name,
  };
}
