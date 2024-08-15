import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class TitleAndRating extends StatelessWidget {
  final String title;
  final String rating;

  const TitleAndRating({
    super.key,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppFonts.bigText.copyWith(height: 1.1),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(0),
            elevation: 2,
            color: AppColors.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    size: 24,
                    color: AppColors.ratingStar,
                  ),
                  Text(
                    rating,
                    style: AppFonts.emphasisHome,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
