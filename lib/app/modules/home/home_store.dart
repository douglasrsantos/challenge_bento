import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/services/services.dart';

part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final UserService userService;
  final OfferBannerService offerBannerService;
  final CategoryService categoryService;

  HomeStoreBase({
    required this.userService,
    required this.offerBannerService,
    required this.categoryService,
  });

  final pageController = PageController();

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
  int currentPageIndex = 0;

  @observable
  UserModel? user;

  @observable
  List<OfferBannerModel> offerBanners = [];

  @observable
  List<CategoryModel> categories = [];

  void init() async {
    isLoading = true;
    infoErrorMessage = null;
    await Future.wait([
      getUserData(),
      getOfferBanners(),
      getCategories(),
    ]);
    isLoading = false;
  }

  ///Get user data
  @action
  Future<void> getUserData() async {
    try {
      final result = await userService.getUser();

      user = result;
    } catch (e) {
      infoErrorMessage = e.toString();
    }
  }

  ///Get all offer banners
  @action
  Future<void> getOfferBanners() async {
    try {
      final result = await offerBannerService.getAllOfferBanners();

      offerBanners = result;
    } catch (e) {
      infoErrorMessage = e.toString();
    }
  }

  ///Get all categories
  @action
  Future<void> getCategories() async {
    try {
      final result = await categoryService.getAllCategories();

      categories = result;
    } catch (e) {
      infoErrorMessage = e.toString();
    }
  }
}
