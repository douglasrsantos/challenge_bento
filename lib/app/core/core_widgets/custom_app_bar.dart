import 'package:challenge_bento/app/core/ui/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class CustomAppBar extends AppBar {
  final bool showFavoriteIcon;
  final Function()? onTapArrowBack;

  CustomAppBar({
    super.key,
    required this.onTapArrowBack,
    this.showFavoriteIcon = false,
  }) : super(
          leading: GestureDetector(
            onTap: onTapArrowBack,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cardCategoriesAndProdInfo,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          ),
          leadingWidth: 64,
          actions: [
            if (showFavoriteIcon)
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cardCategoriesAndProdInfo,
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
          ],
        );
}
