import 'package:flutter/material.dart';

import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InitialButtons(
            onTapOrderAgain: () => context.push('/under-construction'),
            onTapLocalShop: () => context.push('/under-construction'),
          ),
          const BannersList(),
          const BannerListIndicator(),
          const SectionTitle(leftText: 'Shop by category'),
          const CategoriesList(),
          SectionTitle(
            leftText: "Today's Special",
            rightText: 'See all',
            onTapRightText: () {},
          ),
          const ProductsTodaysSpecial()
        ],
      ),
    );
  }
}
