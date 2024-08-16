import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/services/services.dart';

import 'todays_special_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodaysSpecialServiceImpl>()])
void main() {
  late MockTodaysSpecialServiceImpl todaysSpecialServiceImpl;

  //mock today's special model
  List<TodaysSpecialModel> mockValidTodaysSpecialModelList() => [
        TodaysSpecialModel(
          id: 1,
          name: 'mockName',
          rating: 1.1,
          image: 'mockImage',
          colorCode: 'mockColorCode',
        ),
      ];

  //simulates getAllTodaysSpecials request from todaysSpecialServiceImpl
  PostExpectation mockRequest() =>
      when(todaysSpecialServiceImpl.getAllTodaysSpecials());

  //mock of requests who return success
  void mockRequestSuccess(List<TodaysSpecialModel> data) {
    mockRequest().thenAnswer((_) async => data);
  }

  //mock of requests who return errors
  void mockRequestError(dynamic error) {
    mockRequest().thenThrow(error);
  }

  //method who returns function getAllTodaysSpecials
  Future<List<TodaysSpecialModel>> getTodaysSpecials() async {
    return await todaysSpecialServiceImpl.getAllTodaysSpecials();
  }

  //load the todaysSpecialServiceImpl mock before starting tests
  setUp(() {
    todaysSpecialServiceImpl = MockTodaysSpecialServiceImpl();
  });

  test("should return a today's special model", () async {
    mockRequestSuccess(mockValidTodaysSpecialModelList());

    final todaysSpecials = await getTodaysSpecials();

    expect(todaysSpecials.length, 1);
  });

  test('should return empty list if request success, but no have data',
      () async {
    mockRequestSuccess([]);

    final todaysSpecials = await getTodaysSpecials();

    expect(todaysSpecials.isEmpty, true);
  });
}
