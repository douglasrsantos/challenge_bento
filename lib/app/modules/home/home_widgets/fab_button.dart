import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class FabButton extends StatelessWidget {
  const FabButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, -1),
            )
          ],
        ),
        child: SizedBox(
          height: 54,
          width: 54,
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () => context.push('/under-construction'),
            backgroundColor: AppColors.darkBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.shopping_basket_rounded,
              color: AppColors.greenButtons,
            ),
          ),
        ),
      ),
    );
  }
}
