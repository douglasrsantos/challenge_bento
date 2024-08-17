import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/models/models.dart';

void main() {
  ImageModel mockValidImageModel() => ImageModel(
        id: 1,
        image: 'mockImage',
      );

  Map<String, dynamic> mockValidMap() => {
        'id': 1,
        'image': 'mockImage',
      };

  Map<String, dynamic> mockWrongMap() => {
        'id': 1,
      };

  test('should convert a map to a ImageModel', () {
    final imageModel = ImageModel.forModel(mockValidMap());

    expect(imageModel.id, 1);
    expect(imageModel.image, 'mockImage');
  });

  test('should convert a ImageModel to a map', () {
    final map = mockValidImageModel().toMap();

    expect(map['id'], 1);
    expect(map['image'], 'mockImage');
  });

  test('should throws an error if required fields are missing', () {
    expect(
        () => ImageModel.forModel(mockWrongMap()), throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect keys', () {
    mockWrongMap()['wrongKey'] = 'mockValue';

    expect(
        () => ImageModel.forModel(mockWrongMap()), throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect value type',
      () {
    mockWrongMap()['image'] = 2;

    expect(
        () => ImageModel.forModel(mockWrongMap()), throwsA(isA<TypeError>()));
  });
}
