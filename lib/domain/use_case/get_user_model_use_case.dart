import 'package:recipe_app/domain/model/user.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

class GetUserModelUseCase {
  final UserRepository _userRepository;

  GetUserModelUseCase({required UserRepository userRepository})
    : _userRepository = userRepository;

  Future<User> execute(int userId) async {
    return await _userRepository.getUserData(userId);
  }
}
