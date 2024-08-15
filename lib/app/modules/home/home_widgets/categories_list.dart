import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesList({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];

          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24 : 0,
              right: index == categories.length - 1 ? 24 : 0,
            ),
            child: ContentCategoriesList(
              category: category,
              onTap: () => context.push('/under-construction'),
            ),
          );
        },
      ),
    );
  }
}
