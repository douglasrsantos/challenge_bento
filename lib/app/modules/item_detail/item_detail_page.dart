import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

import 'package:challenge_bento/app/core/core_widgets/core_widgets.dart';
import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:challenge_bento/app/modules/item_detail/item_detail.dart';
import 'package:challenge_bento/app/modules/item_detail/item_detail_widgets/item_detail_widgets.dart';

class ItemDetailPage extends StatefulWidget {
  final String id;
  final ItemDetailStore controller;

  const ItemDetailPage({
    super.key,
    required this.id,
    required this.controller,
  });

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  ItemDetailStore get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    reaction((_) => controller.infoErrorMessage, (_) {
      if (controller.hasError) {
        Messages.of(context).showError(controller.infoErrorMessage!);
      }
    });

    reaction((_) => controller.infoSuccessMessage, (_) {
      if (controller.hasSuccess) {
        Messages.of(context).showSuccess(controller.infoSuccessMessage!);
      }
    });

    controller.init(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTapArrowBack: () => context.pop(),
        showFavoriteIcon: true,
      ),
      body: Observer(builder: (_) {
        if (controller.isLoading) {
          return const Loading();
        }

        return Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageList(images: controller.product?.images ?? []),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListIndicator(),
                      ],
                    ),
                    TitleAndRating(
                      title: controller.product?.name ?? '',
                      rating: controller.product?.rating.toString() ?? '',
                    ),
                    ShopText(
                      text: controller.product?.shop ?? '',
                    ),
                    CardProductCharacteristics(
                      productCategories:
                          controller.product?.productCategories ?? [],
                    ),
                    ProductDetails(
                        productDetails: controller.product?.description ?? ''),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: PriceAndAddToCart(
                  finalPrice: controller.calculateFinalPrice(),
                  priceWithoutDiscount:
                      controller.product?.price.toString() ?? '',
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
