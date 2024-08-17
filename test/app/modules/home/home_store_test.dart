import 'package:challenge_bento/app/core/models/offer_banner_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/services/services.dart';
import 'package:challenge_bento/app/modules/home/home.dart';

import 'home_store_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserService>()])
@GenerateNiceMocks([MockSpec<OfferBannerService>()])
@GenerateNiceMocks([MockSpec<CategoryService>()])
@GenerateNiceMocks([MockSpec<TodaysSpecialService>()])
void main() {
  late MockUserService userService;
  late MockOfferBannerService offerBannerService;
  late MockCategoryService categoryService;
  late MockTodaysSpecialService todaysSpecialService;
  late HomeStore controller;

  //mock error message
  final mockError = 'mockError';

  //mock user model
  UserModel mockValidUserModel() => UserModel(
        id: 1,
        type: 'mockType',
        name: 'mockName',
        image: 'mockImage',
      );

  //mock offer banner model
  List<OfferBannerModel> mockValidOfferBannerModel() => [
        OfferBannerModel(
          id: 1,
          title: 'mockTitle',
          subtitle: 'mockSubtitle',
          image: 'mockImage',
          bannerColor: 'mockBannerColor',
        )
      ];

  //simulates getUser request from userService
  PostExpectation mockUserServiceRequest() => when(userService.getUser());

  //simulates getAllOfferBanners request from offerBannerService
  PostExpectation mockOfferBannerServiceRequest() =>
      when(offerBannerService.getAllOfferBanners());

  setUp(() {
    userService = MockUserService();
    offerBannerService = MockOfferBannerService();
    categoryService = MockCategoryService();
    todaysSpecialService = MockTodaysSpecialService();
    controller = HomeStore(
      userService: userService,
      offerBannerService: offerBannerService,
      categoryService: categoryService,
      todaysSpecialService: todaysSpecialService,
    );
  });

  test('should fetch the data from the screen and start the timer', () {
    controller.init();

    verify(userService.getUser()).called(1);
    verify(offerBannerService.getAllOfferBanners()).called(1);
    verify(categoryService.getAllCategories()).called(1);
    verify(todaysSpecialService.getAllTodaysSpecials()).called(1);
    expect(controller.timer, isNotNull);
  });

  test('should return the correct user model and no error', () async {
    mockUserServiceRequest().thenAnswer((_) async => mockValidUserModel());

    await controller.getUserData();

    expect(controller.user?.id, 1);
    expect(controller.infoErrorMessage, isNull);
    expect(controller.isLoading, isFalse);
  });

  test('should handle error on fetch user data correctly', () async {
    mockUserServiceRequest().thenThrow(mockError);

    await controller.getUserData();

    expect(controller.user, isNull);
    expect(controller.infoErrorMessage, mockError);
    expect(controller.isLoading, isFalse);
  });

  test('should return the correct offer banner model and no error', () async {
    mockOfferBannerServiceRequest()
        .thenAnswer((_) async => mockValidOfferBannerModel());

    await controller.getOfferBanners();

    expect(controller.offerBanners.length, 1);
    expect(controller.infoErrorMessage, isNull);
    expect(controller.isLoading, isFalse);
  });

  test('should handle error on fetch offer banner data correctly', () async {
    mockOfferBannerServiceRequest().thenThrow(mockError);

    await controller.getOfferBanners();

    expect(controller.offerBanners, isEmpty);
    expect(controller.infoErrorMessage, mockError);
    expect(controller.isLoading, isFalse);
  });
}
