import 'package:get_it/get_it.dart';

import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';
import 'package:challenge_bento/app/modules/home/home.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<UserService>(
      () => UserServiceImpl(userRepository: getIt<UserRepository>()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerSingleton<HomeStore>(
      HomeStore(userService: getIt<UserService>()));
}
