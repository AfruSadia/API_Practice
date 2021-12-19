// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
import 'package:meta/meta.dart';
import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
  required  this.name,
  required  this.image,
   required this.level,
  required  this.parentId,
  });

  int id;
  String name;
  Image? image;
  String level;
  int parentId;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["id"],
    name: json["name"],
    image: imageValues.map[json["image"]],
    level: json["level"],
    parentId: json["parentId"] == null ? null : json["parentId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": imageValues.reverse![image],
    "level": level,
    "parentId": parentId == null ? null : parentId,
  };
}

enum Image { UPLOADS_CATEGORIES_DEFAULT_WEBP, UPLOADS_CATEGORIES_05_CE99_CDB51949_A7_CFC347_DBF24_F7698_WEBP }

final imageValues = EnumValues({
  "/uploads/categories/05ce99cdb51949a7cfc347dbf24f7698.webp": Image.UPLOADS_CATEGORIES_05_CE99_CDB51949_A7_CFC347_DBF24_F7698_WEBP,
  "/uploads/categories/default.webp": Image.UPLOADS_CATEGORIES_DEFAULT_WEBP
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
