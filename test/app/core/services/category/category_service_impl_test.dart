import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';

import 'category_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CategoryRepository>()])
void main() {
  late MockCategoryRepository categoryRepository;
  late CategoryServiceImpl categoryServiceImpl;

  //mock category model
  List<CategoryModel> mockValidCategoryModelList() => [
        CategoryModel(
          id: 1,
          name: 'mockName',
          image: 'mockImage',
        ),
      ];

  //simulates getAllCategories request from categoryRepository
  PostExpectation mockRequest() => when(categoryRepository.getAllCategories());

  //mock of requests who return success
  void mockRequestSuccess(List<CategoryModel> data) {
    mockRequest().thenAnswer((_) async => data);
  }

  //mock of requests who return errors
  void mockRequestError(dynamic error) {
    mockRequest().thenThrow(error);
  }

  //method who returns function getAllCategories
  Future<List<CategoryModel>> getCategories() async {
    return await categoryServiceImpl.getAllCategories();
  }

  //load the categoryRepository mock before starting tests
  setUp(() {
    categoryRepository = MockCategoryRepository();
    categoryServiceImpl =
        CategoryServiceImpl(categoryRepository: categoryRepository);
  });

  test("should return a category model list", () async {
    mockRequestSuccess(mockValidCategoryModelList());

    final categories = await getCategories();

    expect(categories.length, 1);
  });

  test('should return empty list if request success, but no have data',
      () async {
    mockRequestSuccess([]);

    final categories = await getCategories();

    expect(categories.isEmpty, true);
  });

  test('should return error no data if json file is empty', () async {
    mockRequestError(RequestError.noData);

    expect(() async => await getCategories(), throwsA(RequestError.noData));
  });

  test('should return an error if the request is not completed', () async {
    mockRequestError('generic-error');

    expect(() async => await getCategories(), throwsA('generic-error'));
  });
}
