import 'package:flutter/material.dart';

import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';
import 'package:go_router/go_router.dart';

class ProductsTodaysSpecial extends StatelessWidget {
  const ProductsTodaysSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 120),
      child: Row(
        children: [
          CardProduct(
            onTap: () => context.push('/item-detail'),
          ),
          const Spacer(),
          CardProduct(
            onTap: () => context.push('/item-detail'),
          ),
        ],
      ),
    );
  }
}
