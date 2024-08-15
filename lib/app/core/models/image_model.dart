import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImageModel {
  int id;
  String image;

  ImageModel({
    required this.id,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'image': image,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory ImageModel.forModel(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] as int,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.forModel(json.decode(source) as Map<String, dynamic>);
}
