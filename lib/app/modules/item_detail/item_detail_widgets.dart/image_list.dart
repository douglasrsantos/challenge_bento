import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Image.asset(AppImages.cabbage1);
      },
    );
  }
}
