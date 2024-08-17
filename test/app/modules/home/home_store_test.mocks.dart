// Mocks generated by Mockito 5.4.4 from annotations
// in challenge_bento/test/app/modules/home/home_store_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:challenge_bento/app/core/models/models.dart' as _i4;
import 'package:challenge_bento/app/core/services/category/category_service.dart'
    as _i6;
import 'package:challenge_bento/app/core/services/offer_banner/offer_banner_service.dart'
    as _i5;
import 'package:challenge_bento/app/core/services/todays_special/todays_special_service.dart'
    as _i7;
import 'package:challenge_bento/app/core/services/user/user_service.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [UserService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserService extends _i1.Mock implements _i2.UserService {
  @override
  _i3.Future<_i4.UserModel?> getUser() => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue: _i3.Future<_i4.UserModel?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.UserModel?>.value(),
      ) as _i3.Future<_i4.UserModel?>);
}

/// A class which mocks [OfferBannerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockOfferBannerService extends _i1.Mock
    implements _i5.OfferBannerService {
  @override
  _i3.Future<List<_i4.OfferBannerModel>> getAllOfferBanners() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllOfferBanners,
          [],
        ),
        returnValue: _i3.Future<List<_i4.OfferBannerModel>>.value(
            <_i4.OfferBannerModel>[]),
        returnValueForMissingStub: _i3.Future<List<_i4.OfferBannerModel>>.value(
            <_i4.OfferBannerModel>[]),
      ) as _i3.Future<List<_i4.OfferBannerModel>>);
}

/// A class which mocks [CategoryService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryService extends _i1.Mock implements _i6.CategoryService {
  @override
  _i3.Future<List<_i4.CategoryModel>> getAllCategories() => (super.noSuchMethod(
        Invocation.method(
          #getAllCategories,
          [],
        ),
        returnValue:
            _i3.Future<List<_i4.CategoryModel>>.value(<_i4.CategoryModel>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.CategoryModel>>.value(<_i4.CategoryModel>[]),
      ) as _i3.Future<List<_i4.CategoryModel>>);
}

/// A class which mocks [TodaysSpecialService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodaysSpecialService extends _i1.Mock
    implements _i7.TodaysSpecialService {
  @override
  _i3.Future<List<_i4.TodaysSpecialModel>> getAllTodaysSpecials() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllTodaysSpecials,
          [],
        ),
        returnValue: _i3.Future<List<_i4.TodaysSpecialModel>>.value(
            <_i4.TodaysSpecialModel>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.TodaysSpecialModel>>.value(
                <_i4.TodaysSpecialModel>[]),
      ) as _i3.Future<List<_i4.TodaysSpecialModel>>);
}
