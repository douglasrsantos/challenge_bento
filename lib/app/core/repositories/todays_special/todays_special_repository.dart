import 'package:challenge_bento/app/core/models/models.dart';

abstract class TodaysSpecialRepository {
  ///Get all today's specials
  Future<List<TodaysSpecialModel>> getAllTodaysSpecials();
}
