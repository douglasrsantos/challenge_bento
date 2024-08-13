import 'package:challenge_bento/app/modules/home/home_widgets/user_image.dart';
import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';
import 'package:challenge_bento/app/modules/home/home.dart';
import 'package:challenge_bento/app/modules/home/home_widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  final HomeStore controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.7,
        leading: AppBarLeading(
          type: 'Delivery',
          name: 'Bacangan, Sambit',
          onTap: () {},
        ),
        actions: [
          UserImage(imageAsset: ''),
        ],
      ),
    );
  }
}
