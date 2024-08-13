import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class ContentBannerList extends StatelessWidget {
  const ContentBannerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.cardAvocado,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Top deal !',
                style: AppFonts.additionalInfoTexts,
              ),
              Text(
                'FRESH AVOCADO\nUP TO 15% OFF',
                style: AppFonts.emphasisHome,
              ),
              const SizedBox(height: 12),
              Card(
                color: AppColors.darkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Text(
                    'Shop Now',
                    style: AppFonts.secondaryTexts
                        .copyWith(color: AppColors.greenButtons),
                  ),
                ),
              ),
            ],
          ),
          Image.asset(AppImages.avocado),
        ],
      ),
    );
  }
}
