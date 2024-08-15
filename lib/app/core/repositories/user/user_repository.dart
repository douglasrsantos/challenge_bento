import 'package:challenge_bento/app/core/models/models.dart';

abstract class UserRepository {
  ///Get user
  Future<UserModel> getUser();
}