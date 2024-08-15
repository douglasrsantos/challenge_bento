import 'package:challenge_bento/app/core/models/models.dart';

abstract class TodaysSpecialService {
  ///Get all today's specials
  Future<List<TodaysSpecialModel>> getAllTodaysSpecials();
}
