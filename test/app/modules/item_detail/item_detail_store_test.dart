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

  ProductModel mockValidProductModel() => ProductModel(
        id: 1,
        name: 'mockName',
        rating: 1.1,
        shop: 'mockShop',
        description: 'MockDescription',
        price: 2.2,
        discountPercent: 10,
        productCategories: [],
        images: [],
      );

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
    when(productService.getProductById(productId: anyNamed('productId')))
        .thenAnswer(
      (_) async => mockValidProductModel(),
    );

    await controller.getProduct(2);

    expect(controller.product?.id, 1);
    expect(controller.infoErrorMessage, isNull);
  });
}
