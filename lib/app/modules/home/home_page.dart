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

    reaction((_) => controller.currentBannersImageIndex, (_) {
      controller.animateToPage();
    });

    controller.init();
  }

  @override
  void dispose() {
    controller.timer?.cancel();
    super.dispose();
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
              onTap: () => context.go('/under-construction'),
            );
          }),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FabButton(),
      bottomNavigationBar: Observer(builder: (_) {
        return CustomBottomAppBar(
          currentIndex: controller.currentPageIndex,
          onTapHome: () => controller.onTapNavigateOnBottomBar(0),
          onTapDeals: () => controller.onTapNavigateOnBottomBar(1),
          onTapCart: () => controller.onTapNavigateOnBottomBar(2),
          onTapAccount: () => controller.onTapNavigateOnBottomBar(3),
        );
      }),
      body: Observer(builder: (_) {
        if (controller.isLoading) {
          return const Loading();
        }

        return PageView(
          controller: controller.pageController,
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
