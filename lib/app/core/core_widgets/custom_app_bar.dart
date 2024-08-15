import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class CustomAppBar extends AppBar {
  final bool showFavoriteIcon;
  final bool isFavorite;
  final Widget? icon;
  final Function()? onTapArrowBack;
  final Function()? onTapFavorite;

  CustomAppBar({
    super.key,
    required this.onTapArrowBack,
    this.showFavoriteIcon = false,
    this.isFavorite = false,
    this.icon,
    this.onTapFavorite,
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
                child: GestureDetector(
                  onTap: onTapFavorite,
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cardCategoriesAndProdInfo,
                    ),
                    child: icon,
                  ),
                ),
              ),
          ],
        );
}
