import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';

import 'offer_banner_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<OfferBannerRepositoryImpl>()])
void main() {
  late MockOfferBannerRepositoryImpl offerBannerRepositoryImpl;

  //mock offer banner model
  List<OfferBannerModel> mockValidOfferBannerModelList() => [
        OfferBannerModel(
          id: 1,
          title: 'mockTitle',
          subtitle: 'mockSubtitle',
          image: 'mockImage',
          bannerColor: 'mockBannerColor',
        ),
      ];

  //simulates getAllOfferBanners request from offerBannerRepositoryImpl
  PostExpectation mockRequest() =>
      when(offerBannerRepositoryImpl.getAllOfferBanners());

  //mock of requests who return success
  void mockRequestSuccess(List<OfferBannerModel> data) {
    mockRequest().thenAnswer((_) async => data);
  }

  //mock of requests who return errors
  void mockRequestError(dynamic error) {
    mockRequest().thenThrow(error);
  }

  //method who returns function getAllOfferBanners
  Future<List<OfferBannerModel>> getOfferBanners() async {
    return await offerBannerRepositoryImpl.getAllOfferBanners();
  }

  //load the offerBannerRepositoryImpl mock before starting tests
  setUp(() {
    offerBannerRepositoryImpl = MockOfferBannerRepositoryImpl();
  });

  test("should return a today's special model list", () async {
    mockRequestSuccess(mockValidOfferBannerModelList());

    final offerBanners = await getOfferBanners();

    expect(offerBanners.length, 1);
  });
}
