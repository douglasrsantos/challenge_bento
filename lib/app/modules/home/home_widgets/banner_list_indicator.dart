import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerListIndicator extends StatelessWidget {
  const BannerListIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: AnimatedSmoothIndicator(
        activeIndex: 1,
        count: 3,
        effect: ExpandingDotsEffect(
          dotColor: AppColors.greenButtons.withOpacity(0.5),
          activeDotColor: AppColors.greenButtons,
          dotHeight: 6,
          dotWidth: 6,
          spacing: 4,
        ),
      ),
    );
  }
}
