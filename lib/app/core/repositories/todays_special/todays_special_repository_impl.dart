import 'dart:convert';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/utils/utils.dart';

class TodaysSpecialRepositoryImpl implements TodaysSpecialRepository {
  @override
  Future<List<TodaysSpecialModel>> getAllTodaysSpecials() async {
    try {
      final jsonString = await AccessDataJson.getJson();

      if (jsonString.isEmpty) {
        throw RequestError.noData;
      }

      final jsonData = jsonDecode(jsonString);

      if (jsonData['todaysSpecial'].isEmpty) {
        throw RequestError.noData;
      }

      final todaysSpecial = List.generate(
        jsonData['todaysSpecial'].length,
        (index) =>
            TodaysSpecialModel.forModel(jsonData['todaysSpecial'][index]),
      );

      return todaysSpecial;
    } catch (e) {
      if (e == RequestError.noData) {
        throw "Error getting list of today's special";
      }
      throw e.toString();
    }
  }
}
