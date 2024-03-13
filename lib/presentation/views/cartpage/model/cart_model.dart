// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    List<Cart>? cart;
    final  total;

    CartModel({
        this.cart,
        this.total,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cart: json["cart"] == null ? [] : List<Cart>.from(json["cart"]!.map((x) => Cart.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x.toJson())),
        "total": total,
    };
}

class Cart {
    int? item;
    int? user;
    int? quantity;
    DateTime? dateAdded;
    ItemDetails? itemDetails;

    Cart({
        this.item,
        this.user,
        this.quantity,
        this.dateAdded,
        this.itemDetails,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        item: json["item"],
        user: json["user"],
        quantity: json["quantity"],
        dateAdded: json["date_added"] == null ? null : DateTime.parse(json["date_added"]),
        itemDetails: json["item_details"] == null ? null : ItemDetails.fromJson(json["item_details"]),
    );

    Map<String, dynamic> toJson() => {
        "item": item,
        "user": user,
        "quantity": quantity,
        "date_added": "${dateAdded!.year.toString().padLeft(4, '0')}-${dateAdded!.month.toString().padLeft(2, '0')}-${dateAdded!.day.toString().padLeft(2, '0')}",
        "item_details": itemDetails?.toJson(),
    };
}

class ItemDetails {
    int? id;
    Category? category;
    String? itemName;
    String? price;
    String? description;
    int? stock;
    bool? available;
    String? manufacturer;
    String? itemImage;

    ItemDetails({
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

    factory ItemDetails.fromJson(Map<String, dynamic> json) => ItemDetails(
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category?.toJson(),
        "item_name": itemName,
        "price": price,
        "description": description,
        "stock": stock,
        "available": available,
        "manufacturer": manufacturer,
        "item_image": itemImage,
    };
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_image": categoryImage,
    };
}
