import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserRepositoryImpl>()])
void main() {
  late MockUserRepositoryImpl userRepositoryImpl;

  //mock user model
  UserModel mockValidUserModel() => UserModel(
        id: 1,
        type: 'mockType',
        name: 'mockName',
        image: 'mockImage',
      );

  //simulates getUser request from userRepositoryImpl
  PostExpectation mockRequest() => when(userRepositoryImpl.getUser());

  //mock of requests who return success
  void mockRequestSuccess(UserModel? data) {
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
    userRepositoryImpl = MockUserRepositoryImpl();
  });

  test('should return a user model', () async {
    mockRequestSuccess(mockValidUserModel());

    final user = await getUser();

    expect(user!.id, mockValidUserModel().id);
  });

  test('should return null if request success, but no have data', () async {
    mockRequestSuccess(null);

    final user = await getUser();

    expect(user, null);
  });

  test('should return error no data if json file is empty', () async {
    mockRequestError(RequestError.noData);

    expect(() async => await getUser(), throwsA(RequestError.noData));
  });
}
