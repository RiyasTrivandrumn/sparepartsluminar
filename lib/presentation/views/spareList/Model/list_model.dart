import 'dart:convert';

List<ListModel> listModelFromJson(String str) => List<ListModel>.from(json.decode(str).map((x) => ListModel.fromJson(x)));



class ListModel {
    int? id;
    Category? category;
    String? itemName;
    String? price;
    String? description;
    int? stock;
    bool? available;
    String? manufacturer;
    String? itemImage;

    ListModel({
        this.id,
        this.category,
        this.itemName,
        this.price,
        this.description,
        this.stock,
        this.available,
        this.manufacturer,
        this.itemImage,
    });

    factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        id: json["id"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        itemName: json["item_name"],
        price: json["price"],
        description: json["description"],
        stock: json["stock"],
        available: json["available"],
        manufacturer: json["manufacturer"],
        itemImage: json["item_image"],
    );

  
}

class Category {
    int? id;
    String? categoryName;
    String? categoryImage;

    Category({
        this.id,
        this.categoryName,
        this.categoryImage,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
    );

    
}