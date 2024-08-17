import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/models/models.dart';

void main() {
  OfferBannerModel mockValidOfferBannerModel() => OfferBannerModel(
        id: 1,
        title: 'mockTitle',
        subtitle: 'mockSubtitle',
        image: 'mockImage',
        bannerColor: 'mockBannerColor',
      );

  Map<String, dynamic> mockValidMap() => {
        'id': 1,
        'title': 'mockTitle',
        'subtitle': 'mockSubtitle',
        'image': 'mockImage',
        'bannerColor': 'mockBannerColor',
      };

  Map<String, dynamic> mockWrongMap() => {
        'id': 1,
        'subtitle': 'mockSubtitle',
        'image': 'mockImage',
        'bannerColor': 'mockBannerColor',
      };

  test('should convert a map to a OfferBannerModel', () {
    final offerBannerModel = OfferBannerModel.forModel(mockValidMap());

    expect(offerBannerModel.id, 1);
    expect(offerBannerModel.title, 'mockTitle');
    expect(offerBannerModel.subtitle, 'mockSubtitle');
    expect(offerBannerModel.image, 'mockImage');
    expect(offerBannerModel.bannerColor, 'mockBannerColor');
  });

  test('should convert a OfferBannerModel to a map', () {
    final map = mockValidOfferBannerModel().toMap();

    expect(map['id'], 1);
    expect(map['title'], 'mockTitle');
    expect(map['subtitle'], 'mockSubtitle');
    expect(map['image'], 'mockImage');
    expect(map['bannerColor'], 'mockBannerColor');
  });

  test('should throws an error if required fields are missing', () {
    expect(() => OfferBannerModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect keys', () {
    mockWrongMap()['wrongKey'] = 'mockValue';

    expect(() => OfferBannerModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect value type',
      () {
    mockWrongMap()['title'] = 2;

    expect(() => OfferBannerModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });
}
