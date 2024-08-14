import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class AppBarLeading extends StatelessWidget {
  final String type;
  final String name;
  final Function()? onTap;

  const AppBarLeading({
    super.key,
    required this.type,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            type,
            style: AppFonts.secondaryTexts,
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: AppFonts.additionalInfoTexts,
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.darkBlue,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
