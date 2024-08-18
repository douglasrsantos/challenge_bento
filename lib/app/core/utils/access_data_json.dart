import 'package:flutter/services.dart';

import 'package:challenge_bento/app/core/utils/utils.dart';

class AccessDataJson implements JsonProvider {
  @override
  Future<String> getJson() async {
    final jsonString = await rootBundle.loadString('database/data.json');
    return jsonString;
  }
}
