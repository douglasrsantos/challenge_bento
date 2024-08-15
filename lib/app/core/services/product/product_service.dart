import 'package:challenge_bento/app/core/models/models.dart';

abstract class ProductService {
  ///Get product by id
  Future<ProductModel?> getProductById({required int productId});
}
