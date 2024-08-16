import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';

class BannersList extends StatelessWidget {
  final List<OfferBannerModel> offerBanners;
  final PageController pageController;

  const BannersList({
    super.key,
    required this.offerBanners,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: PageView.builder(
        controller: pageController,
        itemCount: offerBanners.length,
        itemBuilder: (context, index) {
          final offerBanner = offerBanners[index];

          return ContentBannerList(
            onTap: () => context.push('/under-construction'),
            offerBanner: offerBanner,
          );
        },
      ),
    );
  }
}
