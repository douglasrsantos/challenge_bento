import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/services/services.dart';

import 'category_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CategoryServiceImpl>()])
void main() {
  late MockCategoryServiceImpl categoryServiceImpl;

  //mock category model
  List<CategoryModel> mockValidCategoryModelList() => [
        CategoryModel(
          id: 1,
          name: 'mockName',
          image: 'mockImage',
        ),
      ];

  //simulates getAllCategories request from categoryServiceImpl
  PostExpectation mockRequest() => when(categoryServiceImpl.getAllCategories());

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

  //load the categoryServiceImpl mock before starting tests
  setUp(() {
    categoryServiceImpl = MockCategoryServiceImpl();
  });

  test("should return a category model list", () async {
    mockRequestSuccess(mockValidCategoryModelList());

    final categories = await getCategories();

    expect(categories.length, 1);
  });
}
