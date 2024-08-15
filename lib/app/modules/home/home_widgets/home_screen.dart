import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/core/core_widgets/core_widgets.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  final List<OfferBannerModel> offerBanners;

  const HomeScreen({
    super.key,
    required this.offerBanners,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InitialButtons(
            onTapOrderAgain: () => context.push('/under-construction'),
            onTapLocalShop: () => context.push('/under-construction'),
          ),
          BannersList(offerBanners: offerBanners),
          const ListIndicator(),
          SectionTitle(leftText: AppLocalizations.of(context)!.categoryTitle),
          const CategoriesList(),
          SectionTitle(
            leftText: AppLocalizations.of(context)!.todaysSpecialTitle,
            rightText: AppLocalizations.of(context)!.seeAll,
            onTapRightText: () => context.push('/under-construction'),
          ),
          const ProductsTodaysSpecial()
        ],
      ),
    );
  }
}
