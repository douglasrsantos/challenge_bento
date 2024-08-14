import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 120),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: AppFonts.secondaryTexts,
          ),
          Text(
            'ore commonly known as green cabbage, the cannonball cabbage is one of the most popular cabbage varieties. It is so named for the way its leaves wound tightly over one.',
            style: AppFonts.productDescription,
          ),
        ],
      ),
    );
  }
}
