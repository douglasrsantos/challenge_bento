// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: 'HomeStoreBase.hasError'))
      .value;
  Computed<bool>? _$hasSuccessComputed;

  @override
  bool get hasSuccess =>
      (_$hasSuccessComputed ??= Computed<bool>(() => super.hasSuccess,
              name: 'HomeStoreBase.hasSuccess'))
          .value;

  late final _$infoErrorMessageAtom =
      Atom(name: 'HomeStoreBase.infoErrorMessage', context: context);

  @override
  String? get infoErrorMessage {
    _$infoErrorMessageAtom.reportRead();
    return super.infoErrorMessage;
  }

  @override
  set infoErrorMessage(String? value) {
    _$infoErrorMessageAtom.reportWrite(value, super.infoErrorMessage, () {
      super.infoErrorMessage = value;
    });
  }

  late final _$infoSuccessMessageAtom =
      Atom(name: 'HomeStoreBase.infoSuccessMessage', context: context);

  @override
  String? get infoSuccessMessage {
    _$infoSuccessMessageAtom.reportRead();
    return super.infoSuccessMessage;
  }

  @override
  set infoSuccessMessage(String? value) {
    _$infoSuccessMessageAtom.reportWrite(value, super.infoSuccessMessage, () {
      super.infoSuccessMessage = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$currentPageIndexAtom =
      Atom(name: 'HomeStoreBase.currentPageIndex', context: context);

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  late final _$userAtom = Atom(name: 'HomeStoreBase.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$offerBannersAtom =
      Atom(name: 'HomeStoreBase.offerBanners', context: context);

  @override
  List<OfferBannerModel> get offerBanners {
    _$offerBannersAtom.reportRead();
    return super.offerBanners;
  }

  @override
  set offerBanners(List<OfferBannerModel> value) {
    _$offerBannersAtom.reportWrite(value, super.offerBanners, () {
      super.offerBanners = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: 'HomeStoreBase.categories', context: context);

  @override
  List<CategoryModel> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<CategoryModel> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$todaysSpecialsAtom =
      Atom(name: 'HomeStoreBase.todaysSpecials', context: context);

  @override
  List<TodaysSpecialModel> get todaysSpecials {
    _$todaysSpecialsAtom.reportRead();
    return super.todaysSpecials;
  }

  @override
  set todaysSpecials(List<TodaysSpecialModel> value) {
    _$todaysSpecialsAtom.reportWrite(value, super.todaysSpecials, () {
      super.todaysSpecials = value;
    });
  }

  late final _$getUserDataAsyncAction =
      AsyncAction('HomeStoreBase.getUserData', context: context);

  @override
  Future<void> getUserData() {
    return _$getUserDataAsyncAction.run(() => super.getUserData());
  }

  late final _$getOfferBannersAsyncAction =
      AsyncAction('HomeStoreBase.getOfferBanners', context: context);

  @override
  Future<void> getOfferBanners() {
    return _$getOfferBannersAsyncAction.run(() => super.getOfferBanners());
  }

  late final _$getCategoriesAsyncAction =
      AsyncAction('HomeStoreBase.getCategories', context: context);

  @override
  Future<void> getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  late final _$getTodaysSpecialsAsyncAction =
      AsyncAction('HomeStoreBase.getTodaysSpecials', context: context);

  @override
  Future<void> getTodaysSpecials() {
    return _$getTodaysSpecialsAsyncAction.run(() => super.getTodaysSpecials());
  }

  @override
  String toString() {
    return '''
infoErrorMessage: ${infoErrorMessage},
infoSuccessMessage: ${infoSuccessMessage},
isLoading: ${isLoading},
currentPageIndex: ${currentPageIndex},
user: ${user},
offerBanners: ${offerBanners},
categories: ${categories},
todaysSpecials: ${todaysSpecials},
hasError: ${hasError},
hasSuccess: ${hasSuccess}
    ''';
  }
}
