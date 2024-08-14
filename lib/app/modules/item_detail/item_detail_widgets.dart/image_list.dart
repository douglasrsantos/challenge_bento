import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.3,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Image.asset(AppImages.cabbage1);
        },
      ),
    );
  }
}
