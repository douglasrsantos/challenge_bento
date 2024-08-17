import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/models/models.dart';

void main() {
  ProductCategoryModel mockValidProductCategoryModel() => ProductCategoryModel(
        id: 1,
        name: 'mockName',
        image: 'mockImage',
        colorCode: 'mockColorCode',
      );

  Map<String, dynamic> mockValidMap() => {
        'id': 1,
        'name': 'mockName',
        'image': 'mockImage',
        'colorCode': 'mockColorCode',
      };

  Map<String, dynamic> mockWrongMap() => {
        'id': 1,
        'image': 'mockImage',
        'colorCode': 'mockColorCode',
      };

  test('should convert a map to a ProductCategoryModel', () {
    final productCategoryModel = ProductCategoryModel.forModel(mockValidMap());

    expect(productCategoryModel.id, 1);
    expect(productCategoryModel.name, 'mockName');
    expect(productCategoryModel.image, 'mockImage');
    expect(productCategoryModel.colorCode, 'mockColorCode');
  });

  test('should convert a ProductCategoryModel to a map', () {
    final map = mockValidProductCategoryModel().toMap();

    expect(map['id'], 1);
    expect(map['name'], 'mockName');
    expect(map['image'], 'mockImage');
    expect(map['colorCode'], 'mockColorCode');
  });

  test('should throws an error if required fields are missing', () {
    expect(() => ProductCategoryModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect keys', () {
    mockWrongMap()['wrongKey'] = 'mockValue';

    expect(() => ProductCategoryModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect value type',
      () {
    mockWrongMap()['name'] = 2;

    expect(() => ProductCategoryModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });
}
