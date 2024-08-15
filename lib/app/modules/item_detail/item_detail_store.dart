import 'package:mobx/mobx.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/services/services.dart';

part 'item_detail_store.g.dart';

// ignore: library_private_types_in_public_api
class ItemDetailStore = ItemDetailStoreBase with _$ItemDetailStore;

abstract class ItemDetailStoreBase with Store {
  final ProductService productService;

  ItemDetailStoreBase({
    required this.productService,
  });

  @observable
  String? infoErrorMessage;

  @computed
  bool get hasError => infoErrorMessage != null;

  @observable
  String? infoSuccessMessage;

  @computed
  bool get hasSuccess => infoSuccessMessage != null;

  @observable
  bool isLoading = false;

  @observable
  ProductModel? product;

  void init({required String id}) async {
    await getProduct(int.tryParse(id));
  }

  ///Get product data
  @action
  Future<void> getProduct(int? id) async {
    infoErrorMessage = null;
    isLoading = true;
    try {
      final result = await productService.getProductById(productId: id ?? 0);

      product = result;
    } catch (e) {
      infoErrorMessage = e.toString();
    }
    isLoading = false;
  }

  String calculateFinalPrice() {
    if (product != null) {
      double finalPrice =
          product!.price - ((product!.discountPercent * product!.price) / 100);

      return finalPrice.toStringAsFixed(2);
    }

    return '0.00';
  }
}
