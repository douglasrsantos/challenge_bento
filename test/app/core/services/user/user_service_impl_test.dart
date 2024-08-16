import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/services/services.dart';

import 'user_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserServiceImpl>()])
void main() {
  late MockUserServiceImpl userServiceImpl;

//mock user model
  UserModel mockValidUserModel() => UserModel(
        id: 1,
        type: 'mockType',
        name: 'mockName',
        image: 'mockImage',
      );

  //simulates getUser request from userServiceImpl
  PostExpectation mockRequest() => when(userServiceImpl.getUser());

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
    return await userServiceImpl.getUser();
  }

  //load the userServiceImpl mock before starting tests
  setUp(() {
    userServiceImpl = MockUserServiceImpl();
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

    expect(() async => await userServiceImpl.getUser(),
        throwsA(RequestError.noData));
  });

  test('should return an error if the request is not completed', () async {
    mockRequestError('generic-error');

    expect(() async => await getUser(), throwsA('generic-error'));
  });
}
