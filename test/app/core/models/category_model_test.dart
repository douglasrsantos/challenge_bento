import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/models/models.dart';

void main() {
  CategoryModel mockValidCategoryModel() => CategoryModel(
        id: 1,
        name: 'mockName',
        image: 'mockImage',
      );

  Map<String, dynamic> mockValidMap() => {
        'id': 1,
        'name': 'mockName',
        'image': 'mockImage',
      };

  Map<String, dynamic> mockWrongMap() => {
        'id': 1,
        'image': 'mockImage',
      };

  test('should convert a map to a CategoryModel', () {
    final categoryModel = CategoryModel.forModel(mockValidMap());

    expect(categoryModel.id, 1);
    expect(categoryModel.name, 'mockName');
    expect(categoryModel.image, 'mockImage');
  });

  test('should convert a CategoryModel to a map', () {
    final map = mockValidCategoryModel().toMap();

    expect(map['id'], 1);
    expect(map['name'], 'mockName');
    expect(map['image'], 'mockImage');
  });

  test('should throws an error if required fields are missing', () {
    expect(() => CategoryModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect keys', () {
    mockWrongMap()['wrongKey'] = 'mockValue';

    expect(() => CategoryModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect value type',
      () {
    mockWrongMap()['name'] = 2;

    expect(() => CategoryModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });
}
