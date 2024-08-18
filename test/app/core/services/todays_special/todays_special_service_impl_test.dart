import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/services/services.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';

import 'todays_special_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodaysSpecialRepository>()])
void main() {
  late MockTodaysSpecialRepository todaysSpecialRepository;
  late TodaysSpecialServiceImpl todaysSpecialServiceImpl;

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

  //simulates getAllTodaysSpecials request from todaysSpecialRepository
  PostExpectation mockRequest() =>
      when(todaysSpecialRepository.getAllTodaysSpecials());

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
    todaysSpecialRepository = MockTodaysSpecialRepository();
    todaysSpecialServiceImpl = TodaysSpecialServiceImpl(
        todaysSpecialRepository: todaysSpecialRepository);
  });

  test("should return a today's special model list", () async {
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

  test('should return error no data if json file is empty', () async {
    mockRequestError(RequestError.noData);

    expect(() async => await getTodaysSpecials(), throwsA(RequestError.noData));
  });

  test('should return an error if the request is not completed', () async {
    mockRequestError('generic-error');

    expect(() async => await getTodaysSpecials(), throwsA('generic-error'));
  });
}
