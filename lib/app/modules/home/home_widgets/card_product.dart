import 'package:challenge_bento/app/core/models/models.dart';
import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class CardProduct extends StatelessWidget {
  final Function()? onTap;
  final TodaysSpecialModel todaysSpecial;

  const CardProduct({
    super.key,
    required this.onTap,
    required this.todaysSpecial,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:
              Color(0xFF000000 + int.parse(todaysSpecial.colorCode, radix: 16)),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.35,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Image.asset(
                    AppImages.imagesMap[todaysSpecial.image] ?? '',
                    cacheHeight: 377,
                    cacheWidth: 420,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: AppColors.ratingStar,
                        ),
                        Text(
                          todaysSpecial.rating.toString(),
                          style: AppFonts.additionalInfoTexts,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 70,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.backgroundColor,
                ),
                child: Center(
                  child: Text(
                    todaysSpecial.name,
                    style: AppFonts.emphasisHome,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
