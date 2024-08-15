import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodaySpecialModel {
  int id;
  String name;
  num rating;
  String image;

  TodaySpecialModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'rating': rating,
      'image': image,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory TodaySpecialModel.forModel(Map<String, dynamic> map) {
    return TodaySpecialModel(
      id: map['id'] as int,
      name: map['name'] as String,
      rating: map['rating'] as num,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodaySpecialModel.fromJson(String source) =>
      TodaySpecialModel.forModel(json.decode(source) as Map<String, dynamic>);
}
