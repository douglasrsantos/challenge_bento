import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';

class TodaysSpecialServiceImpl implements TodaysSpecialService {
  final TodaysSpecialRepository todaysSpecialRepository;

  TodaysSpecialServiceImpl({required this.todaysSpecialRepository});

  @override
  Future<List<TodaysSpecialModel>> getAllTodaysSpecials() =>
      todaysSpecialRepository.getAllTodaysSpecials();
}
