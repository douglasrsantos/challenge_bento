import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_bento/app/core/core_widgets/core_widgets.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTapArrowBack: () => context.pop(),
        showFavoriteIcon: true,
      ),
    );
  }
}
