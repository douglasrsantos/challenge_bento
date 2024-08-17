import 'package:flutter_test/flutter_test.dart';

import 'package:challenge_bento/app/core/models/models.dart';

void main() {
  UserModel mockValidUserModel() => UserModel(
        id: 1,
        type: 'mockType',
        name: 'mockName',
        image: 'mockImage',
      );

  Map<String, dynamic> mockValidMap() => {
        'id': 1,
        'type': 'mockType',
        'name': 'mockName',
        'image': 'mockImage',
      };

  Map<String, dynamic> mockWrongMap() => {
        'id': 1,
        'name': 'mockName',
        'image': 'mockImage',
      };

  test('should convert a map to a UserModel', () {
    final userModel = UserModel.forModel(mockValidMap());

    expect(userModel.id, 1);
    expect(userModel.type, 'mockType');
    expect(userModel.name, 'mockName');
    expect(userModel.image, 'mockImage');
  });

  test('should convert a UserModel to a map', () {
    final map = mockValidUserModel().toMap();

    expect(map['id'], 1);
    expect(map['type'], 'mockType');
    expect(map['name'], 'mockName');
    expect(map['image'], 'mockImage');
  });

  test('should throws an error if required fields are missing', () {
    expect(() => UserModel.forModel(mockWrongMap()), throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect keys', () {
    mockWrongMap()['wrongKey'] = 'mockValue';

    expect(() => UserModel.forModel(mockWrongMap()), throwsA(isA<TypeError>()));
  });

  test('should throw an error if there are fields with incorrect value type', () {
    mockWrongMap()['type'] = 2;

    expect(() => UserModel.forModel(mockWrongMap()), throwsA(isA<TypeError>()));
  });
}
