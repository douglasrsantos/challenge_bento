import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class ShopText extends StatelessWidget {
  final String text;

  const ShopText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        AppLocalizations.of(context)!.shop(text),
        style: AppFonts.additionalInfoTexts.copyWith(fontSize: 14),
      ),
    );
  }
}
