import 'package:hive/hive.dart';

part '../adapters/language.g.dart';

@HiveType(typeId: 4)
class Language {
  Language({
    this.orderNumber,
    this.id,
    this.name,
    this.code,
    this.v,
  });

  @HiveField(0)
  int orderNumber;
  @HiveField(1)
  String id;
  @HiveField(2)
  String name;
  @HiveField(3)
  String code;
  @HiveField(4)
  int v;

  factory Language.fromMap(Map<String, dynamic> json) => Language(
        orderNumber: json["order_number"],
        id: json["_id"],
        name: json["name"],
        code: json["code"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "order_number": orderNumber,
        "_id": id,
        "name": name,
        "code": code,
        "__v": v,
      };
}
