import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';

import 'product_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>()])
void main() {
  late MockProductRepository productRepository;
  late ProductServiceImpl productServiceImpl;

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

  //simulates getAllProducts request from productRepository
  PostExpectation mockRepositoryRequest() =>
      when(productRepository.getAllProducts());

  //mock of requests who return success
  void mockRepositoryRequestSuccess() {
    mockRepositoryRequest().thenAnswer((_) async => [mockValidProductModel()]);
  }

  //mock of requests who return errors
  void mockRepositoryRequestError(dynamic error) {
    mockRepositoryRequest().thenThrow(error);
  }

  //method who returns function getProductById
  Future<ProductModel?> getProduct(int? id) async {
    return await productServiceImpl.getProductById(productId: id ?? 0);
  }

  //load the productServiceImpl mock before starting tests
  setUp(() {
    productRepository = MockProductRepository();
    productServiceImpl =
        ProductServiceImpl(productRepository: productRepository);
  });

  test('should return a product model', () async {
    mockRepositoryRequestSuccess();

    final product = await getProduct(1);

    expect(product!.id, 1);
  });

  test('should return error not found if product id not exists', () async {
    mockRepositoryRequestSuccess();

    expect(() async => await getProduct(2), throwsA('Product not found'));
  });

  test('should return error no data if json file is empty', () async {
    mockRepositoryRequestError(RequestError.noData);

    expect(() async => await getProduct(1), throwsA('Error getting product'));
  });

  test('should return an error if the request is not completed', () async {
    mockRepositoryRequestError('generic-error');

    expect(() async => await getProduct(1), throwsA('generic-error'));
  });
}
