import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class UserImage extends StatelessWidget {
  final String imageAsset;
  final Function()? onTap;

  const UserImage({
    super.key,
    required this.imageAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.userImageBackground,
          ),
          padding: const EdgeInsets.all(6),
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            cacheHeight: 110,
            cacheWidth: 110,
          ),
        ),
      ),
    );
  }
}
