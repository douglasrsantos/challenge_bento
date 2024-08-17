import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/models/models.dart';

void main() {
  TodaysSpecialModel mockValidTodaysSpecialModel() => TodaysSpecialModel(
        id: 1,
        name: 'mockName',
        rating: 1.1,
        image: 'mockImage',
        colorCode: 'mockColorCode',
      );

  Map<String, dynamic> mockValidMap() => {
        'id': 1,
        'name': 'mockName',
        'rating': 1.1,
        'image': 'mockImage',
        'colorCode': 'mockColorCode',
      };

  Map<String, dynamic> mockWrongMap() => {
        'id': 1,
        'rating': 1.1,
        'image': 'mockImage',
        'colorCode': 'mockColorCode',
      };

  test('should convert a map to a TodaysSpecialModel', () {
    final todaysSpecialModel = TodaysSpecialModel.forModel(mockValidMap());

    expect(todaysSpecialModel.id, 1);
    expect(todaysSpecialModel.name, 'mockName');
    expect(todaysSpecialModel.rating, 1.1);
    expect(todaysSpecialModel.image, 'mockImage');
    expect(todaysSpecialModel.colorCode, 'mockColorCode');
  });

  test('should convert a TodaysSpecialModel to a map', () {
    final map = mockValidTodaysSpecialModel().toMap();

    expect(map['id'], 1);
    expect(map['name'], 'mockName');
    expect(map['rating'], 1.1);
    expect(map['image'], 'mockImage');
    expect(map['colorCode'], 'mockColorCode');
  });

  test('should throws an error if required fields are missing', () {
    expect(() => TodaysSpecialModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect keys', () {
    mockWrongMap()['wrongKey'] = 'mockValue';

    expect(() => TodaysSpecialModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect value type',
      () {
    mockWrongMap()['name'] = 2;

    expect(() => TodaysSpecialModel.forModel(mockWrongMap()),
        throwsA(isA<TypeError>()));
  });
}
