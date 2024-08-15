import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class ContentBannerList extends StatelessWidget {
  final Function()? onTap;

  const ContentBannerList({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                      AppLocalizations.of(context)!.shopNow,
                      style: AppFonts.secondaryTexts
                          .copyWith(color: AppColors.greenButtons),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              AppImages.avocado,
              cacheHeight: 379,
              cacheWidth: 421,
            ),
          ],
        ),
      ),
    );
  }
}
