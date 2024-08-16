import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/core/core_widgets/core_widgets.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  final List<OfferBannerModel> offerBanners;
  final List<CategoryModel> categories;
  final List<TodaysSpecialModel> todaysSpecials;
  final PageController pageController;
  final int bannersCount;

  const HomeScreen({
    super.key,
    required this.offerBanners,
    required this.categories,
    required this.todaysSpecials,
    required this.pageController,
    required this.bannersCount,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InitialButtons(
            onTapOrderAgain: () => context.go('/under-construction'),
            onTapLocalShop: () => context.go('/under-construction'),
          ),
          BannersList(
            offerBanners: offerBanners,
            pageController: pageController,
          ),
          ListIndicator(
            count: 3,
            pageController: pageController,
          ),
          SectionTitle(leftText: AppLocalizations.of(context)!.categoryTitle),
          CategoriesList(categories: categories),
          SectionTitle(
            leftText: AppLocalizations.of(context)!.todaysSpecialTitle,
            rightText: AppLocalizations.of(context)!.seeAll,
            onTapRightText: () => context.go('/under-construction'),
          ),
          ProductsTodaysSpecial(todaysSpecials: todaysSpecials),
        ],
      ),
    );
  }
}
