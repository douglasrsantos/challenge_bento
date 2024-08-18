import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/error/error.dart';
import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/utils/utils.dart';

import 'category_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<JsonProvider>()])
void main() {
  late MockJsonProvider jsonProvider;
  late CategoryRepositoryImpl categoryRepositoryImpl;

  //mock json of categories
  String jsonCategories = jsonEncode({
    'categories': [
      {
        'id': 1,
        'name': 'mockName',
        'image': 'mockImage',
      },
    ]
  });

  //mock empty json of categories
  String emptyJsonCategories = jsonEncode({'categories': []});

  //simulates getJson request from AccessDataJson
  PostExpectation mockRequest() => when(jsonProvider.getJson());

  //mock of requests who return success
  void mockRequestSuccess(String data) {
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
    jsonProvider = MockJsonProvider();
    categoryRepositoryImpl = CategoryRepositoryImpl(jsonProvider: jsonProvider);
  });

  test("should return a category model list", () async {
    mockRequestSuccess(jsonCategories);

    final categories = await getCategories();

    expect(categories.length, 1);
  });

  test('should return empty list if request success, but no have data',
      () async {
    mockRequestSuccess(emptyJsonCategories);

    final categories = await getCategories();

    expect(categories.isEmpty, true);
  });

  test('should return error no data if json file is empty', () async {
    mockRequestError(RequestError.noData);

    expect(() async => await getCategories(),
        throwsA('Error getting list of categories'));
  });

  test('should return an error if the request is not completed', () async {
    mockRequestError('generic-error');

    expect(() async => await getCategories(), throwsA('generic-error'));
  });
}
