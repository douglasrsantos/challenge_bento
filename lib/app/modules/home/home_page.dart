import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

import 'package:challenge_bento/app/core/core_widgets/core_widgets.dart';
import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:challenge_bento/app/modules/home/home.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';
import 'package:challenge_bento/app/modules/under_construction/under_construction.dart';

class HomePage extends StatefulWidget {
  final HomeStore controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    reaction((_) => controller.infoErrorMessage, (_) {
      if (controller.hasError) {
        Messages.of(context).showError(controller.infoErrorMessage!);
      }
    });

    reaction((_) => controller.infoSuccessMessage, (_) {
      if (controller.hasSuccess) {
        Messages.of(context).showSuccess(controller.infoSuccessMessage!);
      }
    });

    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.7,
        leading: Observer(builder: (_) {
          if (controller.isLoading) {
            return const Loading();
          }
          return AppBarLeading(
            type: controller.user?.type ?? '',
            name: controller.user?.name ?? '',
            onTap: () => context.go('/under-construction'),
          );
        }),
        actions: [
          Observer(builder: (_) {
            if (controller.isLoading) {
              return const Loading();
            }
            return UserImage(
              imageAsset: AppImages.imagesMap[controller.user?.image] ?? '',
              onTap: () => context.push('/under-construction'),
            );
          }),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FabButton(),
      bottomNavigationBar: Observer(builder: (_) {
        return CustomBottomAppBar(
          currentIndex: widget.controller.currentPageIndex,
          onTapHome: () {
            widget.controller.pageController.animateToPage(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut);
          },
          onTapDeals: () {
            widget.controller.pageController.animateToPage(1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut);
          },
          onTapCart: () {
            widget.controller.pageController.animateToPage(2,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut);
          },
          onTapAccount: () {
            widget.controller.pageController.animateToPage(3,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut);
          },
        );
      }),
      body: Observer(builder: (_) {
        if (controller.isLoading) {
          return const Loading();
        }

        return PageView(
          controller: widget.controller.pageController,
          onPageChanged: (index) => widget.controller.currentPageIndex = index,
          children: [
            HomeScreen(
              offerBanners: controller.offerBanners,
              categories: controller.categories,
              todaysSpecials: controller.todaysSpecials,
              pageController: controller.bannersPageController,
              bannersCount: controller.offerBanners.length,
            ),
            const UnderConstructionPage(showAppBar: false),
            const UnderConstructionPage(showAppBar: false),
            const UnderConstructionPage(showAppBar: false),
          ],
        );
      }),
    );
  }
}
