import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
    ),
    useMaterial3: true,
  );
}
