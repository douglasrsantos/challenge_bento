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
    return <String, dynamic>{
      'id': id,
      'name': name,
      'rating': rating,
      'image': image,
      'colorCode': colorCode,
    };
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
}
