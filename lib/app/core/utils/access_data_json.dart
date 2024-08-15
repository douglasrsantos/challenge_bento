import 'package:flutter/services.dart';

class AccessDataJson {
  static Future<String> getJson() async {
    final jsonString =
        await rootBundle.loadString('database/data.json');
    return jsonString;
  }
}
