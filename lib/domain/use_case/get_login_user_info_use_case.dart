import 'package:recipe_app/domain/model/user/user.dart';
import 'package:recipe_app/domain/roepositpry/auth_repository.dart';

class GetLoginUserInfoUseCase {
  final AuthRepository _repository;

  GetLoginUserInfoUseCase({required AuthRepository repository})
    : _repository = repository;

  Future<User> execute() async {
    return await _repository.getUser();
  }
}
