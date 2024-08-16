import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/services/services.dart';

import 'offer_banner_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<OfferBannerServiceImpl>()])
void main() {
  late MockOfferBannerServiceImpl offerBannerServiceImpl;

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

  //simulates getAllOfferBanners request from offerBannerServiceImpl
  PostExpectation mockRequest() =>
      when(offerBannerServiceImpl.getAllOfferBanners());

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
    return await offerBannerServiceImpl.getAllOfferBanners();
  }

  //load the offerBannerServiceImpl mock before starting tests
  setUp(() {
    offerBannerServiceImpl = MockOfferBannerServiceImpl();
  });

  test("should return a offer banner model list", () async {
    mockRequestSuccess(mockValidOfferBannerModelList());

    final offerBanners = await getOfferBanners();

    expect(offerBanners.length, 1);
  });

  test('should return empty list if request success, but no have data',
      () async {
    mockRequestSuccess([]);

    final offerBanners = await getOfferBanners();

    expect(offerBanners.isEmpty, true);
  });

  test('should return error no data if json file is empty', () async {
    mockRequestError(RequestError.noData);

    expect(() async => await getOfferBanners(), throwsA(RequestError.noData));
  });

  test('should return an error if the request is not completed', () async {
    mockRequestError('generic-error');

    expect(() async => await getOfferBanners(), throwsA('generic-error'));
  });
}
