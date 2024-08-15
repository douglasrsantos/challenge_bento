import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/ui/ui.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  final PageController pageController;

  const ImageList({
    super.key,
    required this.images,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: PageView.builder(
          controller: pageController,
          itemCount: images.length,
          itemBuilder: (context, index) {
            final imageModel = images[index];

            return Image.asset(AppImages.imagesMap[imageModel.image] ?? '');
          },
        ),
      ),
    );
  }
}
