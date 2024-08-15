import 'package:challenge_bento/app/core/models/models.dart';

abstract class CategoryService {
  ///Get all categories
  Future<List<CategoryModel>> getAllCategories();
}
