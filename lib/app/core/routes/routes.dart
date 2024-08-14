import 'package:challenge_bento/app/core/injection/service_locator.dart';
import 'package:challenge_bento/app/modules/under_construction/under_construction.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/modules/home/home.dart';

final routes = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return HomePage(
          controller: getIt<HomeStore>(),
        );
      },
    ),
    GoRoute(
      path: '/under-construction',
      builder: (context, state) {
        return const UnderConstruction();
      },
    ),
  ],
);
