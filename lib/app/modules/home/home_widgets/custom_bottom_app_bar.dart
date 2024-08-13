import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 20,
      height: 80,
      color: AppColors.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.home,
                color: AppColors.greenButtons,
              ),
              Text(
                'Home',
                style: AppFonts.productDescription
                    .copyWith(color: AppColors.greenButtons),
              ),
            ],
          ),
          GestureDetector(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.local_offer_rounded,
                  color: AppColors.greenButtons.withOpacity(0.5),
                ),
                Text(
                  'Deals',
                  style: AppFonts.productDescription
                      .copyWith(color: AppColors.greenButtons.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shopping_bag,
                  color: AppColors.greenButtons.withOpacity(0.5)),
              Text(
                'Cart',
                style: AppFonts.productDescription
                    .copyWith(color: AppColors.greenButtons.withOpacity(0.5)),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person,
                  color: AppColors.greenButtons.withOpacity(0.5)),
              Text(
                'Account',
                style: AppFonts.productDescription
                    .copyWith(color: AppColors.greenButtons.withOpacity(0.5)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
