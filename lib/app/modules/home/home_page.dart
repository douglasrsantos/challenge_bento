import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:challenge_bento/app/modules/home/home.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';

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
        actions: const [
          UserImage(imageAsset: ''),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 54,
        width: 54,
        child: FloatingActionButton.small(
          elevation: 0,
          onPressed: () {},
          backgroundColor: AppColors.darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            Icons.shopping_basket_rounded,
            color: AppColors.greenButtons,
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: PageView(
        controller: controller.pageController,
        children: [
          HomeScreen(),
        ],
      ),
    );
  }
}
