import 'package:flutter/material.dart';

import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  final Function()? onTapOrderAgain;
  final Function()? onTapLocalShop;

  const HomeScreen({
    super.key,
    required this.onTapOrderAgain,
    required this.onTapLocalShop,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InitialButtons(
          onTapOrderAgain: onTapOrderAgain,
          onTapLocalShop: onTapLocalShop,
        ),
        const BannersList(),
        const BannerListIndicator(),
      ],
    );
  }
}
