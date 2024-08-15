import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class ProductDetails extends StatelessWidget {
  final String productDetails;

  const ProductDetails({
    super.key,
    required this.productDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 120),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.details,
            style: AppFonts.secondaryTexts,
          ),
          Text(
            productDetails,
            style: AppFonts.productDescription,
          ),
        ],
      ),
    );
  }
}
