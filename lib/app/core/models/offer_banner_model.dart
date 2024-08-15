import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OfferBannerModel {
  int id;
  String title;
  String subtitle;
  String image;

  OfferBannerModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'image': image,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory OfferBannerModel.forModel(Map<String, dynamic> map) {
    return OfferBannerModel(
      id: map['id'] as int,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferBannerModel.fromJson(String source) =>
      OfferBannerModel.forModel(json.decode(source) as Map<String, dynamic>);
}
