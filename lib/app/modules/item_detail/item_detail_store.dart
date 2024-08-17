import 'dart:async';

import 'package:flutter/material.dart';
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

  final imagePageController = PageController();

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
  bool isFavorite = false;

  @observable
  int currentImagesIndex = 0;

  @observable
  ProductModel? product;

  Timer? timer;

  ///Before opening the screen loads all the data necessary for display
  void init({required String id}) async {
    startAutoScroll();
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

  ///Calculates the normal value of the product minus the discount
  String calculateFinalPrice() {
    if (product != null) {
      double finalPrice =
          product!.price - ((product!.discountPercent * product!.price) / 100);

      return finalPrice.toStringAsFixed(2);
    }

    return '0.00';
  }

  ///Toggles favorite button
  @action
  void toggleIsFavorite() {
    isFavorite = !isFavorite;
  }

  ///Starts the auto scroll function of banners
  void startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (product != null) {
        if (currentImagesIndex < product!.images.length - 1) {
          currentImagesIndex++;
        } else {
          currentImagesIndex = 0;
        }
      }
    });
  }

  void animateToPage() {
    imagePageController.animateToPage(
      currentImagesIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInToLinear,
    );
  }
}
