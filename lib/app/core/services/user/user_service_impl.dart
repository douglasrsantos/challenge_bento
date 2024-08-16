import 'package:challenge_bento/app/core/models/models.dart';
import 'package:challenge_bento/app/core/repositories/repositories.dart';
import 'package:challenge_bento/app/core/services/services.dart';

class UserServiceImpl implements UserService {
  final UserRepository userRepository;

  UserServiceImpl({required this.userRepository});

  @override
  Future<UserModel?> getUser() => userRepository.getUser();
}
