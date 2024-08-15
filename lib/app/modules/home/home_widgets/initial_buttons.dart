import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';

class InitialButtons extends StatelessWidget {
  final Function()? onTapOrderAgain;
  final Function()? onTapLocalShop;

  const InitialButtons({
    super.key,
    required this.onTapOrderAgain,
    required this.onTapLocalShop,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
      child: Row(
        children: [
          OrderAgainLocalShopButton(
            text: AppLocalizations.of(context)!.orderAgain,
            imageAsset: AppImages.orderAgain,
            onTap: onTapOrderAgain,
          ),
          const Spacer(),
          OrderAgainLocalShopButton(
            text: AppLocalizations.of(context)!.localShop,
            imageAsset: AppImages.localShop,
            onTap: onTapLocalShop,
          ),
        ],
      ),
    );
  }
}
