import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/services/services.dart';
import 'package:challenge_bento/app/modules/item_detail/item_detail.dart';

import 'item_detail_store_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductService>()])
void main() {
  late MockProductService productService;
  late ItemDetailStore controller;

  //mock product model
  ProductModel mockValidProductModel() => ProductModel(
        id: 1,
        name: 'mockName',
        rating: 1.1,
        shop: 'mockShop',
        description: 'MockDescription',
        price: 1,
        discountPercent: 10,
        productCategories: [],
        images: [
          ImageModel(id: 1, image: 'mockImage1'),
          ImageModel(id: 2, image: 'mockImage2'),
        ],
      );

  //simulates getProductById request from productService
  PostExpectation mockRequest() =>
      when(productService.getProductById(productId: anyNamed('productId')));

  //mock of requests who return success
  void mockRequestSuccess(ProductModel? data) {
    mockRequest().thenAnswer((_) async => data);
  }

  //mock of requests who return errors
  void mockRequestError(dynamic error) {
    mockRequest().thenThrow(error);
  }

  setUp(() {
    productService = MockProductService();
    controller = ItemDetailStore(productService: productService);
  });

  test('should search for product information and start the timer', () {
    controller.init(id: '1');

    verify(productService.getProductById(productId: 1)).called(1);
    expect(controller.timer, isNotNull);
  });

  test('should return the correct product model and no error', () async {
    mockRequestSuccess(mockValidProductModel());

    await controller.getProduct(2);

    expect(controller.product?.id, 1);
    expect(controller.infoErrorMessage, isNull);
    expect(controller.isLoading, isFalse);
  });

  test('should handle error correctly', () async {
    mockRequestError('any-error');

    await controller.getProduct(1);

    expect(controller.product, isNull);
    expect(controller.infoErrorMessage, 'any-error');
    expect(controller.isLoading, isFalse);
  });

  test('should calculate final price correctly', () async {
    mockRequestSuccess(mockValidProductModel());

    await controller.getProduct(1);

    final priceString = controller.calculateFinalPrice();

    expect(priceString, '0.90');
  });

  test('should return 0.00 if product is null', () async {
    final priceString = controller.calculateFinalPrice();

    expect(priceString, '0.00');
  });

  test('should toggle isFavorite', () {
    expect(controller.isFavorite, isFalse);
    controller.toggleIsFavorite();
    expect(controller.isFavorite, isTrue);
    controller.toggleIsFavorite();
    expect(controller.isFavorite, isFalse);
  });

  test('should start timer', () async {
    controller.startAutoScroll();

    expect(controller.timer, isNotNull);
  });

  test('should increment the image index every tick', () async {
    mockRequestSuccess(mockValidProductModel());

    await controller.getProduct(1);

    controller.startAutoScroll();

    expect(controller.currentImagesIndex, 0);
    await Future.delayed(const Duration(seconds: 3));
    expect(controller.currentImagesIndex, 1);
    await Future.delayed(const Duration(seconds: 2));
    expect(controller.currentImagesIndex, 0);
  });
}
