import 'package:challenge_bento/app/core/models/models.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/services/services.dart';

import 'user_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserServiceImpl>()])
void main() {
  late MockUserServiceImpl userService;

  UserModel mockValidUserModel() => UserModel(
        id: 1,
        type: 'mockType',
        name: 'mockName',
        image: 'mockImage',
      );

  setUp(() {
    userService = MockUserServiceImpl();
  });
  test('should return a user model', () async {
    when(userService.getUser()).thenAnswer(
      (_) async => mockValidUserModel(),
    );

    final user = await userService.getUser();

    expect(user!.id, mockValidUserModel().id);
  });
}
