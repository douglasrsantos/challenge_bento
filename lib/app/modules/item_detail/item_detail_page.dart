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

    reaction((_) => controller.currentImagesIndex, (_) {
      controller.animateToPage();
    });

    controller.init(id: widget.id);
  }

  @override
  void dispose() {
    controller.timer?.cancel();
    controller.imagePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTapArrowBack: () => context.go('/home'),
        onTapFavorite: () => controller.toggleIsFavorite(),
        isFavorite: controller.isFavorite,
        showFavoriteIcon: true,
        icon: Observer(builder: (_) {
          return Icon(
            controller.isFavorite
                ? Icons.favorite_outlined
                : Icons.favorite_border,
            color: AppColors.darkBlue,
          );
        }),
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
                    ImageList(
                      images: controller.product?.images ?? [],
                      pageController: controller.imagePageController,
                    ),
                    ListIndicator(
                      pageController: controller.imagePageController,
                      count: controller.product?.images.length ?? 0,
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
