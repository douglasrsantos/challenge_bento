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

  test("should return a list of product model", () async {
    mockRequestSuccess(mockValidProductModelList());

    final products = await getProducts();

    expect(products.length, 1);
  });
}
