import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';

import 'category_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CategoryRepositoryImpl>()])
void main() {
  late MockCategoryRepositoryImpl categoryRepositoryImpl;

  //mock category model
  List<CategoryModel> mockValidCategoryModelList() => [
        CategoryModel(
          id: 1,
          name: 'mockName',
          image: 'mockImage',
        ),
      ];

  //simulates getAllCategories request from categoryRepositoryImpl
  PostExpectation mockRequest() =>
      when(categoryRepositoryImpl.getAllCategories());

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
    return await categoryRepositoryImpl.getAllCategories();
  }

  //load the categoryRepositoryImpl mock before starting tests
  setUp(() {
    categoryRepositoryImpl = MockCategoryRepositoryImpl();
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
}
