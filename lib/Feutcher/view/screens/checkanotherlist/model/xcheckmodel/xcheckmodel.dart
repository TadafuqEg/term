// To parse this JSON data, do
//
//     final quotationsModel = quotationsModelFromJson(jsonString);

import 'dart:convert';

QuotationsModel quotationsModelFromJson(String str) => QuotationsModel.fromJson(json.decode(str));

String quotationsModelToJson(QuotationsModel data) => json.encode(data.toJson());

class QuotationsModel {
  List<Datum> ?data;

  QuotationsModel({
    this.data,
  });

  factory QuotationsModel.fromJson(Map<String, dynamic> json) => QuotationsModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int ?id;
  String? name;
  DateTime? createdAt;
  DateTime ?updatedAt;
  List<ListElement>? list;

  Datum({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.list,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class ListElement {
  int? id;
  String ?title;
  Type ?type;
  String? quotationTitleId;
  DateTime? createdAt;
  DateTime ?updatedAt;

  ListElement({
    this.id,
    this.title,
    this.type,
    this.quotationTitleId,
    this.createdAt,
    this.updatedAt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    title: json["title"],
    type: typeValues.map[json["type"]],
    quotationTitleId: json["quotation_title_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "type": typeValues.reverse[type],
    "quotation_title_id": quotationTitleId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

enum Type {
  COUNTRY,
  DROPDOWN_MENU,
  NORMAL,
  REGION,
  TEXT,
  YEARS
}

final typeValues = EnumValues({
  "country": Type.COUNTRY,
  "dropdown_menu": Type.DROPDOWN_MENU,
  "normal": Type.NORMAL,
  "region": Type.REGION,
  "text": Type.TEXT,
  "years": Type.YEARS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
