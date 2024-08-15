import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/services/services.dart';

part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final UserService userService;

  HomeStoreBase({required this.userService});

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

  void init() async {
    isLoading = true;
    await Future.wait([
      getUserData(),
    ]);
    isLoading = false;
  }

  @action
  Future<void> getUserData() async {
    try {
      final result = await userService.getUser();

      user = result;
    } catch (e) {
      infoErrorMessage = e.toString();
    }
  }
}
