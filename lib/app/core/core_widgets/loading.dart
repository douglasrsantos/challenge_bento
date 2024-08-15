import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class Loading extends StatelessWidget {
  final Color? color;

  const Loading({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation(color ?? AppColors.darkBlue),
      ),
    );
  }
}
