import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class ProductCharacteristic extends StatelessWidget {
  final String imageAsset;
  final String text;
  final String colorCode;

  const ProductCharacteristic({
    super.key,
    required this.imageAsset,
    required this.text,
    required this.colorCode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF000000 + int.parse(colorCode, radix: 16)),
          ),
          child: Image.asset(
            imageAsset,
            cacheHeight: 137,
            cacheWidth: 137,
          ),
        ),
        Text(
          text,
          style: AppFonts.productCharacteristics,
        ),
      ],
    );
  }
}
