import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class UserImage extends StatelessWidget {
  final String imageAsset;

  const UserImage({
    super.key,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.vegetarianGreen,
          ),
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
