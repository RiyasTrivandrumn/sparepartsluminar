// To parse this JSON data, do
//
//     final deadModel = deadModelFromJson(jsonString);

import 'dart:convert';

List<DeadModel> deadModelFromJson(String str) =>
    List<DeadModel>.from(json.decode(str).map((x) => DeadModel.fromJson(x)));

class DeadModel {
  int? id;
  String? itemName;
  String? price;
  String? description;
  String? manufacturer;
  String? itemImage;

  DeadModel({
    this.id,
    this.itemName,
    this.price,
    this.description,
    this.manufacturer,
    this.itemImage,
  });

  factory DeadModel.fromJson(Map<String, dynamic> json) => DeadModel(
        id: json["id"],
        itemName: json["item_name"],
        price: json["price"],
        description: json["description"],
        manufacturer: json["manufacturer"],
        itemImage: json["item_image"],
      );
}
