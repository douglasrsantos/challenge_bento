import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/ui/ui.dart';

class ContentCategoriesList extends StatelessWidget {
  final CategoryModel category;
  final Function()? onTap;

  const ContentCategoriesList({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.cardCategoriesAndProdInfo,
            ),
            height: 70,
            width: 70,
            child: Image.asset(
              AppImages.imagesMap[category.image] ?? '',
              cacheHeight: 148,
              cacheWidth: 148,
            ),
          ),
          Text(
            category.name,
            style: AppFonts.category,
          ),
        ],
      ),
    );
  }
}
