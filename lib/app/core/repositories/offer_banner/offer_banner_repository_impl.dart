import 'dart:convert';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/utils/utils.dart';

class OfferBannerRepositoryImpl implements OfferBannerRepository {
  @override
  Future<List<OfferBannerModel>> getAllOfferBanners() async {
    try {
      final jsonString = await AccessDataJson.getJson();

      if (jsonString.isEmpty) {
        throw RequestError.noData;
      }

      final jsonData = jsonDecode(jsonString);

      if (jsonData['offerBanners'].isEmpty) {
        throw RequestError.noData;
      }

      final offerBanners = List.generate(
        jsonData['offerBanners'].length,
        (index) => OfferBannerModel.forModel(jsonData['offerBanners'][index]),
      );

      return offerBanners;
    } catch (e) {
      if (e == RequestError.noData) {
        throw 'Error getting user data';
      }
      throw e.toString();
    }
  }
}
