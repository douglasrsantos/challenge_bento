import 'package:challenge_bento/app/core/models/product_model.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';

class ProductServiceImpl implements ProductService {
  final ProductRepository productRepository;

  ProductServiceImpl({required this.productRepository});

  @override
  Future<ProductModel?> getProductById({required int productId}) async {
    final result = await productRepository.getAllProducts();

    if (result.isEmpty) {
      return null;
    }

    ProductModel product =
        result.firstWhere((product) => product.id == productId);

    return product;
  }
}
