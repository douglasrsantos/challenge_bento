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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageList(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListIndicator(),
                    ],
                  ),
                  TitleAndRating(),
                  ShopText(),
                  CardProductCharacteristics(),
                  ProductDetails(),
                ],
              ),
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
