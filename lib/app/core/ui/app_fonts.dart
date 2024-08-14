import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:challenge_bento/app/core/ui/ui.dart';

class AppFonts {
  ///TextStyle of product detail title and price
  static TextStyle bigText = GoogleFonts.nunito(
    fontSize: 28,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w800,
  );

  ///TextStyle of emphasis texts on the home
  static TextStyle emphasisHome = GoogleFonts.nunito(
    fontSize: 18,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w800,
    // height: 1.2
  );

  ///TextStyle of secondary texts
  static TextStyle secondaryTexts = GoogleFonts.nunito(
    fontSize: 18,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w800,
  );

  ///TextStyle of secondary texts
  static TextStyle seeAll = GoogleFonts.nunito(
    fontSize: 16,
    color: AppColors.greenButtons,
    fontWeight: FontWeight.w700,
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
    fontWeight: FontWeight.w900,
  );

  ///TextStyle of price and discount on product detail page
  static TextStyle priceAndDiscountTexts = GoogleFonts.nunito(
    fontSize: 16,
    color: AppColors.darkBlue.withOpacity(0.3),
    fontWeight: FontWeight.w700,
  );

  ///TextStyle of product description
  static TextStyle productDescription = GoogleFonts.nunito(
    fontSize: 12,
    color: AppColors.darkBlue,
  );

  ///TextStyle of text in button add to cart on product detail page
  static TextStyle addToCart = GoogleFonts.nunito(
    fontSize: 16,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w800,
  );
}
