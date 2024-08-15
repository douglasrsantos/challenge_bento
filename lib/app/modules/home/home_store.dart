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

  HomeStoreBase({
    required this.userService,
    required this.offerBannerService,
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

  void init() async {
    isLoading = true;
    infoErrorMessage = null;
    await Future.wait([
      getUserData(),
      getOfferBanners(),
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
}
