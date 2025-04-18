import 'package:recipe_app/domain/model/user/user.dart';
import 'package:recipe_app/domain/roepositpry/user_repository.dart';

class GetUserInfoUseCase {
  final UserRepository _repository;

  GetUserInfoUseCase({required UserRepository repository})
    : _repository = repository;

  Future<User> execute(String userName) async {
    return await _repository.getUser(userName);
  }
}
