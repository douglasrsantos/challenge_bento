import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/utils/utils.dart';

import 'todays_special_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<JsonProvider>()])
void main() {
  late MockJsonProvider jsonProvider;
  late TodaysSpecialRepositoryImpl todaysSpecialRepositoryImpl;

  //mock json of today's specials
  String jsonTodaysSpecials = jsonEncode({
    'todaysSpecial': [
      {
        'id': 1,
        'name': 'mockName',
        'rating': 1.1,
        'image': 'mockImage',
        'colorCode': 'mockColorCode',
      },
    ]
  });

  //mock empty json of today's specials
  String emptyJsonTodaysSpecials = jsonEncode({'todaysSpecial': []});

  //simulates getJson request from AccessDataJson
  PostExpectation mockRequest() => when(jsonProvider.getJson());

  //mock of requests who return success
  void mockRequestSuccess(String data) {
    mockRequest().thenAnswer((_) async => data);
  }

  //mock of requests who return errors
  void mockRequestError(dynamic error) {
    mockRequest().thenThrow(error);
  }

  //method who returns function getAllTodaysSpecials
  Future<List<TodaysSpecialModel>> getTodaysSpecials() async {
    return await todaysSpecialRepositoryImpl.getAllTodaysSpecials();
  }

  //load the todaysSpecialRepositoryImpl mock before starting tests
  setUp(() {
    jsonProvider = MockJsonProvider();
    todaysSpecialRepositoryImpl =
        TodaysSpecialRepositoryImpl(jsonProvider: jsonProvider);
  });

  test("should return a today's special model list", () async {
    mockRequestSuccess(jsonTodaysSpecials);

    final todaysSpecials = await getTodaysSpecials();

    expect(todaysSpecials.length, 1);
  });

  test('should return empty list if request success, but no have data',
      () async {
    mockRequestSuccess(emptyJsonTodaysSpecials);

    final todaysSpecials = await getTodaysSpecials();

    expect(todaysSpecials.isEmpty, true);
  });

  test('should return error no data if json file is empty', () async {
    mockRequestError(RequestError.noData);

    expect(() async => await getTodaysSpecials(),
        throwsA("Error getting list of today's special"));
  });

  test('should return an error if the request is not completed', () async {
    mockRequestError('generic-error');

    expect(() async => await getTodaysSpecials(), throwsA('generic-error'));
  });
}
