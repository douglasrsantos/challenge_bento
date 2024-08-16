import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/ui/ui.dart';

class ContentBannerList extends StatelessWidget {
  final Function()? onTap;
  final OfferBannerModel offerBanner;

  const ContentBannerList({
    super.key,
    required this.onTap,
    required this.offerBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(
                0xFF000000 + int.parse(offerBanner.bannerColor, radix: 16)),
          ),
          clipBehavior: Clip.hardEdge,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    offerBanner.title,
                    style: AppFonts.additionalInfoTexts,
                  ),
                  Text(
                    offerBanner.subtitle,
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
                AppImages.imagesMap[offerBanner.image] ?? '',
                cacheHeight: 379,
                cacheWidth: 421,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
