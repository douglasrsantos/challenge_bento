import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(AppImages.underConstruction),
            ),
            Text(
              AppLocalizations.of(context)!.noDataTitle,
              style: AppFonts.bigText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.noDataSubtitle,
              style: AppFonts.emphasisHome,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
