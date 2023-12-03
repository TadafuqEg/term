// To parse this JSON data, do
//
//     final conteryModel = conteryModelFromJson(jsonString);

import 'dart:convert';

ConteryModel conteryModelFromJson(String str) => ConteryModel.fromJson(json.decode(str));

String conteryModelToJson(ConteryModel data) => json.encode(data.toJson());

class ConteryModel {
  bool? success;
  String? message;
  List<Datum>? data;
  String? responseTime;

  ConteryModel({
    this.success,
    this.message,
    this.data,
    this.responseTime,
  });

  factory ConteryModel.fromJson(Map<String, dynamic> json) => ConteryModel(
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
  int ?id;
  String ? name;

  Datum({
    this.id,
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
