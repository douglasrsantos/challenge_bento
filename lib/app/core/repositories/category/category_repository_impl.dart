import 'dart:convert';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/utils/utils.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final jsonString = await AccessDataJson.getJson();

      if (jsonString.isEmpty) {
        throw RequestError.noData;
      }

      final jsonData = jsonDecode(jsonString);

      if (jsonData['categories'].isEmpty) {
        throw RequestError.noData;
      }

      final categories = List.generate(
        jsonData['categories'].length,
        (index) => CategoryModel.forModel(jsonData['categories'][index]),
      );

      return categories;
    } catch (e) {
      if (e == RequestError.noData) {
        throw 'Error getting list of categories';
      }
      throw e.toString();
    }
  }
}
