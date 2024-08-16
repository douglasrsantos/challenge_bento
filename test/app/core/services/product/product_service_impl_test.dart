import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';

import 'product_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductServiceImpl>()])
@GenerateNiceMocks([MockSpec<ProductRepository>()])
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
  PostExpectation mockRequest({int? id}) => when(productServiceImpl
      .getProductById(productId: id ?? anyNamed('productId')));

  //mock of requests who return success
  void mockRequestSuccess() {
    mockRequest().thenAnswer((_) async => mockValidProductModel());
  }

  //mock of requests who return errors
  void mockRequestError(dynamic error, {int? id}) {
    mockRequest(id: id).thenThrow(error);
  }

  //method who returns function getProductById
  Future<ProductModel?> getProduct(int? id) async {
    return await productServiceImpl.getProductById(productId: id);
  }

  //load the productServiceImpl mock before starting tests
  setUp(() {
    productServiceImpl = MockProductServiceImpl();
  });

  test('should return a product model', () async {
    mockRequestSuccess();

    final product = await getProduct(1);

    expect(product!.id, 1);
  });

  test('should return error not found if product id not exists', () async {
    mockRequestError(RequestError.notFound, id: 2);

    expect(() async => await getProduct(2), throwsA(RequestError.notFound));
  });

  test('should return error no data if json file is empty', () async {
    mockRequestError(RequestError.noData);

    expect(() async => await getProduct(1), throwsA(RequestError.noData));
  });

  test('should return an error if the request is not completed', () async {
    mockRequestError('generic-error');

    expect(() async => await getProduct(1), throwsA('generic-error'));
  });
}
