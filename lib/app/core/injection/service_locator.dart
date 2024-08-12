import 'package:get_it/get_it.dart';

import 'package:challenge_bento/app/modules/home/home.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // getIt.registerLazySingleton<IContact>(
  //     () => ContactRepository(hiveService: getIt<HiveService>(), Dio()));
  // getIt.registerLazySingleton<IUser>(
  //     () => UserRepository(hiveService: getIt<HiveService>()));
  // getIt.registerSingleton<AppStore>(AppStore(
  //   hiveService: getIt<HiveService>(),
  //   userRepository: getIt<IUser>(),
  // ));
  getIt.registerSingleton<HomeStore>(HomeStore());
}
