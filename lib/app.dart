import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/routes/routes.dart';
import 'package:challenge_bento/app/core/ui/ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Challenge Bento',
      debugShowCheckedModeBanner: false,
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
      theme: AppTheme.appTheme,
    );
  }
}
