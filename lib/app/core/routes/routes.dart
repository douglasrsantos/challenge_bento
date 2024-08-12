import 'package:challenge_bento/app/core/injection/service_locator.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/modules/home/home.dart';

final routes = GoRouter(
  initialLocation: '/home',
  routes: [
    // GoRoute(
    //   path: '/register',
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: RegisterPage(
    //         controller: getIt<RegisterStore>(),
    //       ),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity:
    //               CurveTween(curve: Curves.easeInOutCirc).animate(animation),
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    // ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return HomePage(
          controller: getIt<HomeStore>(),
        );
      },
    ),
  ],
);
