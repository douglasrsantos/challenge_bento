import 'package:challenge_bento/app/core/models/models.dart';

abstract class OfferBannerRepository {
  ///Get all offer banners
  Future<List<OfferBannerModel>> getAllOfferBanners();
}
