import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:challenge_bento/app/modules/item_detail/item_detail_widgets.dart/item_detail_widgets.dart';

class CardProductCharacteristics extends StatelessWidget {
  const CardProductCharacteristics({super.key});

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
          children: [
            ProductCharacteristic(
              imageAsset: AppImages.imagesMap['vegetarian'] ?? '',
              text: 'Vegetarian',
            ),
            ProductCharacteristic(
              imageAsset: AppImages.imagesMap['halal-food'] ?? '',
              text: 'Halal Food',
            ),
            ProductCharacteristic(
              imageAsset: AppImages.imagesMap['gluten-free'] ?? '',
              text: 'Gluten-free',
            ),
          ],
        ),
      ),
    );
  }
}
