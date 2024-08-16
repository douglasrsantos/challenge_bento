import 'dart:convert';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/utils/utils.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final jsonString = await AccessDataJson.getJson();

      if (jsonString.isEmpty) {
        throw RequestError.noData;
      }

      final jsonData = jsonDecode(jsonString);

      if (jsonData['products'].isEmpty) {
        return [];
      }

      final products = List.generate(
        jsonData['products'].length,
        (index) => ProductModel.forModel(jsonData['products'][index]),
      );

      return products;
    } catch (e) {
      if (e == RequestError.noData) {
        throw "Error getting list of products";
      }
      throw e.toString();
    }
  }
}
