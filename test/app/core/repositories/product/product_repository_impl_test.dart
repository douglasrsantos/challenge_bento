import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/utils/utils.dart';

import 'product_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<JsonProvider>()])
void main() {
  late MockJsonProvider jsonProvider;
  late ProductRepositoryImpl productRepositoryImpl;

  //mock json of products
  String jsonProducts = jsonEncode({
    'products': [
      {
        'id': 1,
        'name': 'mockName',
        'rating': 1.1,
        'shop': 'mockShop',
        'description': 'mockDescription',
        'price': 1.1,
        'discountPercent': 1.1,
        'productCategories': [],
        'images': [],
      },
    ]
  });

  //mock empty json of products
  String emptyJsonProducts = jsonEncode({'products': []});

  //simulates getJson request from AccessDataJson
  PostExpectation mockRequest() => when(jsonProvider.getJson());

  //mock of requests who return success
  void mockRequestSuccess(String data) {
    mockRequest().thenAnswer((_) async => data);
  }

  //mock of requests who return errors
  void mockRequestError(dynamic error) {
    mockRequest().thenThrow(error);
  }

  //method who returns function getAllProducts
  Future<List<ProductModel>> getProducts() async {
    return await productRepositoryImpl.getAllProducts();
  }

  //load the productRepositoryImpl mock before starting tests
  setUp(() {
    jsonProvider = MockJsonProvider();
    productRepositoryImpl = ProductRepositoryImpl(jsonProvider: jsonProvider);
  });

  test("should return a product model list", () async {
    mockRequestSuccess(jsonProducts);

    final products = await getProducts();

    expect(products.length, 1);
  });

  test('should return empty list if request success, but no have data',
      () async {
    mockRequestSuccess(emptyJsonProducts);

    final products = await getProducts();

    expect(products.isEmpty, true);
  });

  test('should return error no data if json file is empty', () async {
    mockRequestError(RequestError.noData);

    expect(() async => await getProducts(),
        throwsA('Error getting list of products'));
  });

  test('should return an error if the request is not completed', () async {
    mockRequestError('generic-error');

    expect(() async => await getProducts(), throwsA('generic-error'));
  });
}
