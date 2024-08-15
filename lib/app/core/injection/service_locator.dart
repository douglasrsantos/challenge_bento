import 'package:get_it/get_it.dart';

import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';
import 'package:challenge_bento/app/modules/home/home.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  //Injecting user dependencies
  getIt.registerLazySingleton<UserService>(
      () => UserServiceImpl(userRepository: getIt<UserRepository>()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  //Injecting offer banner dependencies
  getIt.registerLazySingleton<OfferBannerService>(() => OfferBannerServiceImpl(
      offerBannerRepository: getIt<OfferBannerRepository>()));
  getIt.registerLazySingleton<OfferBannerRepository>(
      () => OfferBannerRepositoryImpl());

  //Injecting category dependencies
  getIt.registerLazySingleton<CategoryService>(() =>
      CategoryServiceImpl(categoryRepository: getIt<CategoryRepository>()));
  getIt.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl());

  //Injecting today's specials dependencies
  getIt.registerLazySingleton<TodaysSpecialService>(() =>
      TodaysSpecialServiceImpl(
          todaysSpecialRepository: getIt<TodaysSpecialRepository>()));
  getIt.registerLazySingleton<TodaysSpecialRepository>(
      () => TodaysSpecialRepositoryImpl());

  //Injecting home controller dependencies
  getIt.registerSingleton<HomeStore>(HomeStore(
    userService: getIt<UserService>(),
    offerBannerService: getIt<OfferBannerService>(),
    categoryService: getIt<CategoryService>(),
    todaysSpecialService: getIt<TodaysSpecialService>(),
  ));
}
