import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/services/services.dart';

import 'product_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductServiceImpl>()])
void main() {
  late MockProductServiceImpl productServiceImpl;

  //mock product model
  ProductModel mockValidProductModel() => ProductModel(
        id: 1,
        name: 'mockName',
        rating: 1.1,
        shop: 'mockShop',
        description: 'mockDescription',
        price: 1.1,
        discountPercent: 1.1,
        productCategories: [],
        images: [],
      );

  //simulates getProductById request from productServiceImpl
  PostExpectation mockRequest(int id) =>
      when(productServiceImpl.getProductById(productId: id));

  //mock of requests who return success
  void mockRequestSuccess({required int id, required ProductModel? data}) {
    mockRequest(id).thenAnswer((_) async => data);
  }

  //mock of requests who return errors
  void mockRequestError({required int id, required dynamic error}) {
    mockRequest(id).thenThrow(error);
  }

  //method who returns function getProductById
  Future<ProductModel?> getProduct(int id) async {
    return await productServiceImpl.getProductById(productId: id);
  }

  //load the productServiceImpl mock before starting tests
  setUp(() {
    productServiceImpl = MockProductServiceImpl();
  });

  test('should return a product model', () async {
    mockRequestSuccess(id: 1, data: mockValidProductModel());

    final user = await getProduct(1);

    expect(user!.id, mockValidProductModel().id);
  });
}
