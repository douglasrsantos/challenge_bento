// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  int id;
  String type;
  String name;
  String image;

  UserModel({
    required this.id,
    required this.type,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'name': name,
      'image': image,
    };
  }

  factory UserModel.forModel(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      type: map['type'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }
}
