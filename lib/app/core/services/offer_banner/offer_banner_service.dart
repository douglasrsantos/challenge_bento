import 'package:challenge_bento/app/core/models/models.dart';

abstract class OfferBannerService {
  ///Get all offer banners
  Future<List<OfferBannerModel>> getAllOfferBanners();
}
