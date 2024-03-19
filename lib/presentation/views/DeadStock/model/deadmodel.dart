// To parse this JSON data, do
//
//     final deadModel = deadModelFromJson(jsonString);

import 'dart:convert';

List<DeadModel> deadModelFromJson(String str) => List<DeadModel>.from(json.decode(str).map((x) => DeadModel.fromJson(x)));



class DeadModel {
    int? id;
    String? deadstockItem;
    String? price;
    String? description;
    int? stock;
    bool? available;
    String? manufacturer;
    String? itemImage;

    DeadModel({
        this.id,
        this.deadstockItem,
        this.price,
        this.description,
        this.stock,
        this.available,
        this.manufacturer,
        this.itemImage,
    });

    factory DeadModel.fromJson(Map<String, dynamic> json) => DeadModel(
        id: json["id"],
        deadstockItem: json["deadstock_item"],
        price: json["price"],
        description: json["description"],
        stock: json["stock"],
        available: json["available"],
        manufacturer: json["manufacturer"],
        itemImage: json["item_image"],
    );

    
}
