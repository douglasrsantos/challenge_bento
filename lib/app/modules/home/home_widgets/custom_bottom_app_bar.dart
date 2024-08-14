import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Function()? onTapHome;
  final Function()? onTapDeals;
  final Function()? onTapCart;
  final Function()? onTapAccount;
  final int currentIndex;

  const CustomBottomAppBar({
    super.key,
    required this.onTapHome,
    required this.onTapDeals,
    required this.onTapCart,
    required this.onTapAccount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 20,
      height: 80,
      color: AppColors.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: onTapHome,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home,
                  color: currentIndex == 0
                      ? AppColors.greenButtons
                      : AppColors.greenButtons.withOpacity(0.5),
                ),
                Text(
                  'Home',
                  style: currentIndex == 0
                      ? AppFonts.productDescription
                          .copyWith(color: AppColors.greenButtons)
                      : AppFonts.productDescription.copyWith(
                          color: AppColors.greenButtons.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTapDeals,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.local_offer_rounded,
                  color: currentIndex == 1
                      ? AppColors.greenButtons
                      : AppColors.greenButtons.withOpacity(0.5),
                ),
                Text(
                  'Deals',
                  style: currentIndex == 1
                      ? AppFonts.productDescription
                          .copyWith(color: AppColors.greenButtons)
                      : AppFonts.productDescription.copyWith(
                          color: AppColors.greenButtons.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: onTapCart,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.shopping_bag,
                  color: currentIndex == 2
                      ? AppColors.greenButtons
                      : AppColors.greenButtons.withOpacity(0.5),
                ),
                Text(
                  'Cart',
                  style: currentIndex == 2
                      ? AppFonts.productDescription
                          .copyWith(color: AppColors.greenButtons)
                      : AppFonts.productDescription.copyWith(
                          color: AppColors.greenButtons.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTapAccount,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person,
                  color: currentIndex == 3
                      ? AppColors.greenButtons
                      : AppColors.greenButtons.withOpacity(0.5),
                ),
                Text(
                  'Account',
                  style: currentIndex == 3
                      ? AppFonts.productDescription
                          .copyWith(color: AppColors.greenButtons)
                      : AppFonts.productDescription.copyWith(
                          color: AppColors.greenButtons.withOpacity(0.5)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
