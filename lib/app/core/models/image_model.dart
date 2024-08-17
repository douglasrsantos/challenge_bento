// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImageModel {
  int id;
  String image;

  ImageModel({
    required this.id,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
    };
  }

  factory ImageModel.forModel(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] as int,
      image: map['image'] as String,
    );
  }
}
