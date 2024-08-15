import 'package:challenge_bento/app/core/models/models.dart';

abstract class UserService {
  ///Get user
  Future<UserModel> getUser();
}