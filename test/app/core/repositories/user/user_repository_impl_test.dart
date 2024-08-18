import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/utils/utils.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<JsonProvider>()])
void main() {
  late MockJsonProvider jsonProvider;
  late UserRepositoryImpl userRepositoryImpl;

  //mock json of user
  String jsonUser = jsonEncode({
    'user': {
      'id': 1,
      'type': 'mockType',
      'name': 'mockName',
      'image': 'mockImage',
    },
  });

  //mock empty json of user
  String emptyJsonUser = jsonEncode({'user': []});

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

  //method who returns function getUser
  Future<UserModel?> getUser() async {
    return await userRepositoryImpl.getUser();
  }

  //load the userRepositoryImpl mock before starting tests
  setUp(() {
    jsonProvider = MockJsonProvider();
    userRepositoryImpl = UserRepositoryImpl(jsonProvider: jsonProvider);
  });

  test('should return a user model', () async {
    mockRequestSuccess(jsonUser);

    final user = await getUser();

    final mapUser = jsonDecode(jsonUser);

    expect(user!.id, mapUser['user']['id']);
  });

  test('should return null if request success, but no have data', () async {
    mockRequestSuccess(emptyJsonUser);

    final user = await getUser();

    expect(user, null);
  });

  test('should return error no data if json file is empty', () async {
    mockRequestError(RequestError.noData);

    expect(() async => await getUser(), throwsA('Error getting user data'));
  });

  test('should return an error if the request is not completed', () async {
    mockRequestError('generic-error');

    expect(() async => await getUser(), throwsA('generic-error'));
  });
}
