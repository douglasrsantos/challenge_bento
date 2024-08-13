import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class OrderAgainLocalShopButton extends StatelessWidget {
  final String text;
  final String imageAsset;
  final Function()? onTap;

  const OrderAgainLocalShopButton({
    super.key,
    required this.text,
    required this.imageAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.greenButtons,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    text,
                    style: AppFonts.emphasisHome,
                  ),
                ),
              ),
              Positioned(
                right: -15,
                bottom: -20,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(imageAsset),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
