import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductCategoryModel {
  int id;
  String name;
  String image;

  ProductCategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'image': image,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory ProductCategoryModel.forModel(Map<String, dynamic> map) {
    return ProductCategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategoryModel.fromJson(String source) =>
      ProductCategoryModel.forModel(json.decode(source) as Map<String, dynamic>);
}
