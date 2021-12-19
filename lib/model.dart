// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
    required this.name,
    required this.image,
    required this.level,
    this.parentId,
    this.children,
  });

  int id;
  String name;
  Image? image;
  String level;
  int? parentId;
  List<Welcome>? children;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        name: json["name"],
        image: imageValues.map[json["image"]],
        level: json["level"],
        parentId: json["parentId"] == null ? null : json["parentId"],
        children: json["children"] == null
            ? null
            : List<Welcome>.from(
                json["children"].map((x) => Welcome.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": imageValues.reverse![image],
        "level": level,
        "parentId": parentId == null ? null : parentId,
        "children": children == null
            ? null
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}

enum Image {
  UPLOADS_CATEGORIES_DEFAULT_WEBP,
  UPLOADS_CATEGORIES_05_CE99_CDB51949_A7_CFC347_DBF24_F7698_WEBP
}

final imageValues = EnumValues({
  "/uploads/categories/05ce99cdb51949a7cfc347dbf24f7698.webp":
      Image.UPLOADS_CATEGORIES_05_CE99_CDB51949_A7_CFC347_DBF24_F7698_WEBP,
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
