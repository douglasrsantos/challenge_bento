import 'dart:convert';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/utils/utils.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserModel?> getUser() async {
    try {
      final jsonString = await AccessDataJson.getJson();

      if (jsonString.isEmpty) {
        throw RequestError.noData;
      }

      final jsonData = jsonDecode(jsonString);

      if (jsonData['user'].isEmpty) {
        return null;
      }

      return UserModel.forModel(jsonData['user']);
    } catch (e) {
      if (e == RequestError.noData) {
        throw 'Error getting user data';
      }
      throw e.toString();
    }
  }
}
