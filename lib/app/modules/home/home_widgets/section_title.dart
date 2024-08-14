import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class SectionTitle extends StatelessWidget {
  final String leftText;
  final String? rightText;
  final Function()? onTapRightText;

  const SectionTitle({
    super.key,
    required this.leftText,
    this.rightText,
    this.onTapRightText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: AppFonts.emphasisHome,
          ),
          if (rightText != null)
            GestureDetector(
              onTap: onTapRightText,
              child: Text(
                rightText!,
                style: AppFonts.seeAll,
              ),
            ),
        ],
      ),
    );
  }
}
