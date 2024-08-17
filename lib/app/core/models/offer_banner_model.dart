// ignore_for_file: public_member_api_docs, sort_constructors_first
class OfferBannerModel {
  int id;
  String title;
  String subtitle;
  String image;
  String bannerColor;

  OfferBannerModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.bannerColor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'image': image,
      'bannerColor': bannerColor,
    };
  }

  factory OfferBannerModel.forModel(Map<String, dynamic> map) {
    return OfferBannerModel(
      id: map['id'] as int,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      image: map['image'] as String,
      bannerColor: map['bannerColor'] as String,
    );
  }
}
