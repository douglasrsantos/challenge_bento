import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/modules/home/home.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';
import 'package:challenge_bento/app/modules/under_construction/under_construction.dart';

class HomePage extends StatelessWidget {
  final HomeStore controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.7,
        leading: AppBarLeading(
          type: 'Delivery',
          name: 'Bacangan, Sambit',
          onTap: () {},
        ),
        actions: [
          UserImage(
            imageAsset: '',
            onTap: () => context.push('/under-construction'),
          ),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FabButton(),
      bottomNavigationBar: Observer(builder: (_) {
        return CustomBottomAppBar(
          currentIndex: controller.currentPageIndex,
          onTapHome: () {
            controller.pageController.animateToPage(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut);
          },
          onTapDeals: () {
            controller.pageController.animateToPage(1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut);
          },
          onTapCart: () {
            controller.pageController.animateToPage(2,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut);
          },
          onTapAccount: () {
            controller.pageController.animateToPage(3,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut);
          },
        );
      }),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) => controller.currentPageIndex = index,
        children: const [
          HomeScreen(),
          UnderConstructionPage(showAppBar: false),
          UnderConstructionPage(showAppBar: false),
          UnderConstructionPage(showAppBar: false),
        ],
      ),
    );
  }
}
