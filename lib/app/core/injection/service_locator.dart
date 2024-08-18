import 'package:get_it/get_it.dart';

import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';
import 'package:challenge_bento/app/core/utils/utils.dart';
import 'package:challenge_bento/app/modules/home/home.dart';
import 'package:challenge_bento/app/modules/item_detail/item_detail.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  //Injecting Access Data Json dependencies
  getIt.registerLazySingleton<JsonProvider>(() => AccessDataJson());

  //Injecting user dependencies
  getIt.registerLazySingleton<UserService>(
      () => UserServiceImpl(userRepository: getIt<UserRepository>()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        jsonProvider: getIt<JsonProvider>(),
      ));

  //Injecting offer banner dependencies
  getIt.registerLazySingleton<OfferBannerService>(() => OfferBannerServiceImpl(
      offerBannerRepository: getIt<OfferBannerRepository>()));
  getIt.registerLazySingleton<OfferBannerRepository>(
      () => OfferBannerRepositoryImpl(
            jsonProvider: getIt<JsonProvider>(),
          ));

  //Injecting category dependencies
  getIt.registerLazySingleton<CategoryService>(() =>
      CategoryServiceImpl(categoryRepository: getIt<CategoryRepository>()));
  getIt.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(
        jsonProvider: getIt<JsonProvider>(),
      ));

  //Injecting today's specials dependencies
  getIt.registerLazySingleton<TodaysSpecialService>(() =>
      TodaysSpecialServiceImpl(
          todaysSpecialRepository: getIt<TodaysSpecialRepository>()));
  getIt.registerLazySingleton<TodaysSpecialRepository>(
      () => TodaysSpecialRepositoryImpl(
            jsonProvider: getIt<JsonProvider>(),
          ));

//Injecting products dependencies
  getIt.registerLazySingleton<ProductService>(
      () => ProductServiceImpl(productRepository: getIt<ProductRepository>()));
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
        jsonProvider: getIt<JsonProvider>(),
      ));

  //Injecting home controller dependencies
  getIt.registerSingleton<HomeStore>(HomeStore(
    userService: getIt<UserService>(),
    offerBannerService: getIt<OfferBannerService>(),
    categoryService: getIt<CategoryService>(),
    todaysSpecialService: getIt<TodaysSpecialService>(),
  ));

  //Injecting item detail controller dependencies
  getIt.registerFactory<ItemDetailStore>(() => ItemDetailStore(
        productService: getIt<ProductService>(),
      ));
}
