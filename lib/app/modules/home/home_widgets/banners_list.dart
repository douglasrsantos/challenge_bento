import 'package:flutter/material.dart';

import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';
import 'package:go_router/go_router.dart';

class BannersList extends StatelessWidget {
  const BannersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 24),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24 : 0,
              right: index == 3 - 1 ? 24 : 0,
            ),
            child: ContentBannerList(
              onTap: () => context.push('/under-construction'),
            ),
          );
        },
      ),
    );
  }
}
