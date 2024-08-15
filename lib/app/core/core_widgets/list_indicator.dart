import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListIndicator extends StatelessWidget {
  final PageController pageController;
  final int count;

  const ListIndicator({
    super.key,
    required this.pageController,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SmoothPageIndicator(
              controller: pageController,
              count: count,
              effect: ExpandingDotsEffect(
                dotColor: AppColors.greenButtons.withOpacity(0.5),
                activeDotColor: AppColors.greenButtons,
                dotHeight: 6,
                dotWidth: 6,
                spacing: 4,
              ),
            )

            // AnimatedSmoothIndicator(
            //   activeIndex: 1,
            //   count: 3,
            // effect: ExpandingDotsEffect(
            //   dotColor: AppColors.greenButtons.withOpacity(0.5),
            //   activeDotColor: AppColors.greenButtons,
            //   dotHeight: 6,
            //   dotWidth: 6,
            //   spacing: 4,
            // ),
            // ),
            ),
      ],
    );
  }
}
