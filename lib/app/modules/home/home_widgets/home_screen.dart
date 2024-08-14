import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/core/core_widgets/core_widgets.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';

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
          const ListIndicator(),
          const SectionTitle(leftText: 'Shop by category'),
          const CategoriesList(),
          SectionTitle(
            leftText: "Today's Special",
            rightText: 'See all',
            onTapRightText: () => context.push('/under-construction'),
          ),
          const ProductsTodaysSpecial()
        ],
      ),
    );
  }
}
