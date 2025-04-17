import 'package:recipe_app/domain/model/user/user.dart';
import 'package:recipe_app/domain/roepositpry/user_repository.dart';

class GetUserInfoUseCase {
  final UserRepository userRepository;

  GetUserInfoUseCase({required this.userRepository});

  Future<User> execute(String userName) async {
    return await userRepository.getUser(userName);
  }
}
