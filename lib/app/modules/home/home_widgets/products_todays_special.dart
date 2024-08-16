import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';
import 'package:go_router/go_router.dart';

class ProductsTodaysSpecial extends StatelessWidget {
  final List<TodaysSpecialModel> todaysSpecials;

  const ProductsTodaysSpecial({
    super.key,
    required this.todaysSpecials,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 120),
      child: Row(
        children: [
          CardProduct(
            onTap: () => context.go('/item-detail/${todaysSpecials[0].id}'),
            todaysSpecial: todaysSpecials[0],
          ),
          const Spacer(),
          CardProduct(
            onTap: () => context.go('/item-detail/${todaysSpecials[1].id}'),
            todaysSpecial: todaysSpecials[1],
          ),
        ],
      ),
    );
  }
}
