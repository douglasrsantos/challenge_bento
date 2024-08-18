import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/product_model.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';

class ProductServiceImpl implements ProductService {
  final ProductRepository productRepository;

  ProductServiceImpl({required this.productRepository});

  @override
  Future<ProductModel?> getProductById({required int productId}) async {
    try {
      final result = await productRepository.getAllProducts();

      if (result.isEmpty) {
        throw RequestError.noData;
      }

      ProductModel product = result.firstWhere(
        (product) => product.id == productId,
        orElse: () => throw RequestError.notFound,
      );

      return product;
    } catch (e) {
      if (e == RequestError.noData) {
        throw "Error getting product";
      }

      if (e == RequestError.notFound) {
        throw "Product not found";
      }
      throw e.toString();
    }
  }
}
