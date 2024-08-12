// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:challenge_bento/app/core/models/models.dart';

class ProductModel {
  int id;
  String name;
  num rating;
  String shop;
  String description;
  num price;
  num discountPercent;
  List<ProductCategoryModel> productCategories;
  List<ImageModel> images;

  ProductModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.shop,
    required this.description,
    required this.price,
    required this.discountPercent,
    required this.productCategories,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'rating': rating,
      'shop': shop,
      'description': description,
      'price': price,
      'discountPercent': discountPercent,
      'productCategories': productCategories.map((x) => x.toMap()).toList(),
      'images': images.map((x) => x.toMap()).toList(),
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      rating: map['rating'] as num,
      shop: map['shop'] as String,
      description: map['description'] as String,
      price: map['price'] as num,
      discountPercent: map['discountPercent'] as num,
      productCategories: List<ProductCategoryModel>.from(
        (map['productCategories'] as List<int>).map<ProductCategoryModel>(
          (x) => ProductCategoryModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      images: List<ImageModel>.from(
        (map['images'] as List<int>).map<ImageModel>(
          (x) => ImageModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
