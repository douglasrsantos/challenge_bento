import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class AppFonts {
  ///TextStyle of product detail title and price
  static TextStyle bigText = GoogleFonts.nunito(
    fontSize: 32,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w700,
  );

  ///TextStyle of emphasis texts on the home
  static TextStyle emphasisHome = GoogleFonts.nunito( 
    fontSize: 16,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w800,
  );

  ///TextStyle of secondary texts
  static TextStyle secondaryTexts = GoogleFonts.nunito(
    fontSize: 18,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w800,
  );

  ///TextStyle of texts that provide additional information
  static TextStyle additionalInfoTexts = GoogleFonts.nunito(
    fontSize: 16,
    color: AppColors.darkBlue,
  );

  ///TextStyle of categories
  static TextStyle category = GoogleFonts.nunito(
    fontSize: 14,
    color: AppColors.darkBlue,
  );

  ///TextStyle of price and discount on product detail page
  static TextStyle priceAndDiscountTexts = GoogleFonts.nunito(
    fontSize: 14,
    color: AppColors.cardCategoriesAndProdInfo,
    fontWeight: FontWeight.w400,
  );

  ///TextStyle of product description
  static TextStyle productDescription = GoogleFonts.nunito(
    fontSize: 12,
    color: AppColors.darkBlue,
  );
}
