import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';

class OfferBannerServiceImpl implements OfferBannerService {
  final OfferBannerRepository offerBannerRepository;

  OfferBannerServiceImpl({required this.offerBannerRepository});

  @override
  Future<List<OfferBannerModel>> getAllOfferBanners() => offerBannerRepository.getAllOfferBanners();
}
