import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/models/models.dart';

void main() {
  ProductModel mockValidProductModel() => ProductModel(
        id: 1,
        name: 'mockName',
        rating: 1.1,
        shop: 'mockShop',
        description: 'mockDescription',
        price: 2.2,
        discountPercent: 10,
        productCategories: [],
        images: [],
      );

  Map<String, dynamic> mockValidMap() => {
        'id': 1,
        'name': 'mockName',
        'rating': 1.1,
        'shop': 'mockShop',
        'description': 'mockDescription',
        'price': 2.2,
        'discountPercent': 10,
        'productCategories': [],
        'images': [],
      };

  Map<String, dynamic> mockWrongMap() => {
        'id': 1,
        'rating': 1.1,
        'shop': 'mockShop',
        'description': 'mockDescription',
        'price': 2.2,
        'discountPercent': 10,
        'productCategories': [],
        'images': [],
      };

  test('should convert a map to a ProductModel', () {
    final productModel = ProductModel.forModel(mockValidMap());

    expect(productModel.id, 1);
    expect(productModel.name, 'mockName');
    expect(productModel.rating, 1.1);
    expect(productModel.shop, 'mockShop');
    expect(productModel.description, 'mockDescription');
    expect(productModel.price, 2.2);
    expect(productModel.discountPercent, 10);
    expect(productModel.productCategories.isEmpty, true);
    expect(productModel.images.isEmpty, true);
  });

  test('should convert a ProductModel to a map', () {
    final map = mockValidProductModel().toMap();

    expect(map['id'], 1);
    expect(map['rating'], 1.1);
    expect(map['shop'], 'mockShop');
    expect(map['description'], 'mockDescription');
    expect(map['price'], 2.2);
    expect(map['discountPercent'], 10);
    expect(map['productCategories'], []);
    expect(map['images'], []);
  });

  test('should throws an error if required fields are missing', () {
    expect(
        () => ProductModel.forModel(mockWrongMap()), throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect keys', () {
    mockWrongMap()['wrongKey'] = 'mockValue';

    expect(
        () => ProductModel.forModel(mockWrongMap()), throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect value type',
      () {
    mockWrongMap()['name'] = 2;

    expect(
        () => ProductModel.forModel(mockWrongMap()), throwsA(isA<TypeError>()));
  });
}
