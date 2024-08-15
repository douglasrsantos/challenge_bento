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

  //Injecting offer banners dependencies
  getIt.registerLazySingleton<OfferBannerService>(() => OfferBannerServiceImpl(
      offerBannerRepository: getIt<OfferBannerRepository>()));
  getIt.registerLazySingleton<OfferBannerRepository>(
      () => OfferBannerRepositoryImpl());

  //Injecting home controller dependencies
  getIt.registerSingleton<HomeStore>(HomeStore(
    userService: getIt<UserService>(),
    offerBannerService: getIt<OfferBannerService>(),
  ));
}
