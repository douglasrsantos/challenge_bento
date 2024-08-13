import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InitialButtons(
          onTapOrderAgain: () {},
          onTapLocalShop: () {},
        ),
      ],
    );
  }
}
