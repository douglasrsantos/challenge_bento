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
}
