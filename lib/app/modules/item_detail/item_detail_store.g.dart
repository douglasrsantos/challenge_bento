// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemDetailStore on ItemDetailStoreBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: 'ItemDetailStoreBase.hasError'))
          .value;
  Computed<bool>? _$hasSuccessComputed;

  @override
  bool get hasSuccess =>
      (_$hasSuccessComputed ??= Computed<bool>(() => super.hasSuccess,
              name: 'ItemDetailStoreBase.hasSuccess'))
          .value;

  late final _$infoErrorMessageAtom =
      Atom(name: 'ItemDetailStoreBase.infoErrorMessage', context: context);

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
      Atom(name: 'ItemDetailStoreBase.infoSuccessMessage', context: context);

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
      Atom(name: 'ItemDetailStoreBase.isLoading', context: context);

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

  late final _$isFavoriteAtom =
      Atom(name: 'ItemDetailStoreBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$productAtom =
      Atom(name: 'ItemDetailStoreBase.product', context: context);

  @override
  ProductModel? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ProductModel? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$getProductAsyncAction =
      AsyncAction('ItemDetailStoreBase.getProduct', context: context);

  @override
  Future<void> getProduct(int? id) {
    return _$getProductAsyncAction.run(() => super.getProduct(id));
  }

  late final _$ItemDetailStoreBaseActionController =
      ActionController(name: 'ItemDetailStoreBase', context: context);

  @override
  void toggleIsFavorite() {
    final _$actionInfo = _$ItemDetailStoreBaseActionController.startAction(
        name: 'ItemDetailStoreBase.toggleIsFavorite');
    try {
      return super.toggleIsFavorite();
    } finally {
      _$ItemDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
infoErrorMessage: ${infoErrorMessage},
infoSuccessMessage: ${infoSuccessMessage},
isLoading: ${isLoading},
isFavorite: ${isFavorite},
product: ${product},
hasError: ${hasError},
hasSuccess: ${hasSuccess}
    ''';
  }
}
