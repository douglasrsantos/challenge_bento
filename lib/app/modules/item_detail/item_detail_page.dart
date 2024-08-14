import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/core/core_widgets/core_widgets.dart';
import 'package:challenge_bento/app/modules/item_detail/item_detail_widgets.dart/item_detail_widgets.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTapArrowBack: () => context.pop(),
        showFavoriteIcon: true,
      ),
      body: const Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageList(),
                ListIndicator(),
                TitleAndRating(),
                CardProductCharacteristics(),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PriceAndAddToCart(),
            ),
          ),
        ],
      ),
    );
  }
}
