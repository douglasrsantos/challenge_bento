import 'package:flutter/material.dart';

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
              'Under Construction!',
              style: AppFonts.bigText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Soon we will have incredible news for you!',
              style: AppFonts.emphasisHome,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
