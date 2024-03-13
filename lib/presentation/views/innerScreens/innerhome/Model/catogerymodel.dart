import 'dart:convert';

List<CatogeryModel> catogeryModelFromJson(String str) =>
    List<CatogeryModel>.from(
        json.decode(str).map((x) => CatogeryModel.fromJson(x)));

String catogeryModelToJson(List<CatogeryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatogeryModel {
  int? id;
  String? categoryName;
  String? categoryImage;

  CatogeryModel({
    this.id,
    this.categoryName,
    this.categoryImage,
  });

  factory CatogeryModel.fromJson(Map<String, dynamic> json) {
    return CatogeryModel(
      id: json["id"],
      categoryName: json["category_name"],
      categoryImage: json["category_image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_image": categoryImage,
      };
}
