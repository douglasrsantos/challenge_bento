import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:challenge_bento/app/modules/item_detail/item_detail_widgets/item_detail_widgets.dart';

class CardProductCharacteristics extends StatelessWidget {
  final List<ProductCategoryModel> productCategories;

  const CardProductCharacteristics({
    super.key,
    required this.productCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.cardCategoriesAndProdInfo,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: productCategories
              .map((e) => ProductCharacteristic(
                    imageAsset: AppImages.imagesMap[e.image] ?? '',
                    text: e.name,
                    colorCode: e.colorCode,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
