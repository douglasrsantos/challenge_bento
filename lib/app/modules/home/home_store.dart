import 'dart:async';

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
  final TodaysSpecialService todaysSpecialService;

  HomeStoreBase({
    required this.userService,
    required this.offerBannerService,
    required this.categoryService,
    required this.todaysSpecialService,
  });

  final pageController = PageController();
  final bannersPageController = PageController();

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
  int currentBannersImageIndex = 0;

  @observable
  UserModel? user;

  @observable
  List<OfferBannerModel> offerBanners = [];

  @observable
  List<CategoryModel> categories = [];

  @observable
  List<TodaysSpecialModel> todaysSpecials = [];

  Timer? timer;

  ///Before opening the screen loads all the data necessary for display
  void init() async {
    startAutoScroll();
    isLoading = true;
    infoErrorMessage = null;
    await Future.wait([
      getUserData(),
      getOfferBanners(),
      getCategories(),
      getTodaysSpecials(),
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

  ///Get today's specials
  @action
  Future<void> getTodaysSpecials() async {
    try {
      final result = await todaysSpecialService.getAllTodaysSpecials();

      todaysSpecials = result;
    } catch (e) {
      infoErrorMessage = e.toString();
    }
  }

  ///Starts the auto scroll function of banners
  void startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (currentBannersImageIndex < offerBanners.length - 1) {
        currentBannersImageIndex++;
      } else {
        currentBannersImageIndex = 0;
      }
    });
  }

  void animateToPage() {
    bannersPageController.animateToPage(
      currentBannersImageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInToLinear,
    );
  }

  ///Navigate to the clicked page in the bottom bar
  void onTapNavigateOnBottomBar(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }
}
