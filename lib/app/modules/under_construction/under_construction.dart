import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/core_widgets/core_widgets.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: NoDataWidget(),
      ),
    );
  }
}
