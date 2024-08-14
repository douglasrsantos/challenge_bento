import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class ContentCategoriesList extends StatelessWidget {
  final String text;

  const ContentCategoriesList({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            AppImages.veganCategory,
            cacheHeight: 148,
            cacheWidth: 148,
          ),
        ),
        Text(
          text,
          style: AppFonts.category,
        ),
      ],
    );
  }
}
