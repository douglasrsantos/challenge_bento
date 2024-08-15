import 'package:challenge_bento/app/core/injection/service_locator.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/modules/item_detail/item_detail.dart';
import 'package:challenge_bento/app/modules/home/home.dart';
import 'package:challenge_bento/app/modules/under_construction/under_construction.dart';

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
      path: '/item-detail/:id',
      builder: (context, state) {
        final String id = state.pathParameters['id']!;
        return ItemDetailPage(
          id: id,
          controller: getIt<ItemDetailStore>(),
        );
      },
    ),
    GoRoute(
      path: '/under-construction',
      builder: (context, state) {
        return const UnderConstructionPage();
      },
    ),
  ],
);
