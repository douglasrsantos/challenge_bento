import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:go_router/go_router.dart';

class PriceAndAddToCart extends StatelessWidget {
  const PriceAndAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, -1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.price,
                  style: AppFonts.priceAndDiscountTexts,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '\$6.90',
                      style: AppFonts.bigText,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '\$8.15',
                      style: AppFonts.priceAndDiscountTexts.copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.darkBlue.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => context.push('/under-construction'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.5, 50),
                backgroundColor: AppColors.greenButtons,
              ),
              child: Text(
                AppLocalizations.of(context)!.addToCart,
                style: AppFonts.addToCart,
              ),
            )
          ],
        ),
      ),
    );
  }
}
