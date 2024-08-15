import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodaysSpecialModel {
  int id;
  String name;
  num rating;
  String image;
  String colorCode;

  TodaysSpecialModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.image,
    required this.colorCode,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'rating': rating,
      'image': image,
      'colorCode': colorCode,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory TodaysSpecialModel.forModel(Map<String, dynamic> map) {
    return TodaysSpecialModel(
      id: map['id'] as int,
      name: map['name'] as String,
      rating: map['rating'] as num,
      image: map['image'] as String,
      colorCode: map['colorCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodaysSpecialModel.fromJson(String source) =>
      TodaysSpecialModel.forModel(json.decode(source) as Map<String, dynamic>);
}
