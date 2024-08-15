import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';

class CategoryServiceImpl implements CategoryService {
  final CategoryRepository categoryRepository;

  CategoryServiceImpl({required this.categoryRepository});

  @override
  Future<List<CategoryModel>> getAllCategories() =>
      categoryRepository.getAllCategories();
}
