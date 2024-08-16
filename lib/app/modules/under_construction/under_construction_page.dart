import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/core_widgets/core_widgets.dart';
import 'package:go_router/go_router.dart';

class UnderConstructionPage extends StatelessWidget {
  final bool showAppBar;

  const UnderConstructionPage({
    super.key,
    this.showAppBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? CustomAppBar(
              onTapArrowBack: () => context.go('/home'),
            )
          : null,
      body: const Center(
        child: NoDataWidget(),
      ),
    );
  }
}
