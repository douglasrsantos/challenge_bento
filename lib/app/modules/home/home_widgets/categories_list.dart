import 'package:flutter/material.dart';

import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24 : 0,
              right: index == 5 - 1 ? 24 : 0,
            ),
            child: const ContentCategoriesList(text: 'Vegan'),
          );
        },
      ),
    );
  }
}
