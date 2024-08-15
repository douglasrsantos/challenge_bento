import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';

class BannersList extends StatelessWidget {
  final List<OfferBannerModel> offerBanners;

  const BannersList({
    super.key,
    required this.offerBanners,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        itemCount: offerBanners.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 24),
        itemBuilder: (context, index) {
          final offerBanner = offerBanners[index];

          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24 : 0,
              right: index == offerBanners.length - 1 ? 24 : 0,
            ),
            child: ContentBannerList(
              onTap: () => context.push('/under-construction'),
              offerBanner: offerBanner,
            ),
          );
        },
      ),
    );
  }
}
