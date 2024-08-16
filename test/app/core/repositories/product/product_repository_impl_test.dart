import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';

import 'product_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductRepositoryImpl>()])
void main() {
  late MockProductRepositoryImpl productRepositoryImpl;

  //mock product model
  List<ProductModel> mockValidProductModelList() => [
        ProductModel(
          id: 1,
          name: 'mockName',
          rating: 1.1,
          shop: 'mockShop',
          description: 'mockDescription',
          price: 1.1,
          discountPercent: 1.1,
          productCategories: [],
          images: [],
        ),
      ];

  //simulates getAllProducts request from productServiceImpl
  PostExpectation mockRequest() => when(productRepositoryImpl.getAllProducts());

  //mock of requests who return success
  void mockRequestSuccess(List<ProductModel> data) {
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
    productRepositoryImpl = MockProductRepositoryImpl();
  });

  test("should return a product model list", () async {
    mockRequestSuccess(mockValidProductModelList());

    final products = await getProducts();

    expect(products.length, 1);
  });

  test('should return empty list if request success, but no have data',
      () async {
    mockRequestSuccess([]);

    final products = await getProducts();

    expect(products.isEmpty, true);
  });

  test('should return error no data if json file is empty', () async {
    mockRequestError(RequestError.noData);

    expect(() async => await getProducts(), throwsA(RequestError.noData));
  });

  test('should return an error if the request is not completed', () async {
    mockRequestError('generic-error');

    expect(() async => await getProducts(), throwsA('generic-error'));
  });
}
