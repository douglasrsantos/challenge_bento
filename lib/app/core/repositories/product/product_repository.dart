import 'package:challenge_bento/app/core/models/models.dart';

abstract class ProductRepository {
  ///Get all products
  Future<List<ProductModel>> getAllProducts();
}
