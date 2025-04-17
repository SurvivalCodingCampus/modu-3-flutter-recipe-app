import 'package:recipe_app/domain/model/user/user.dart';
import 'package:recipe_app/domain/roepositpry/auth_repository.dart';

class GetLoginUserInfo {
  final AuthRepository _repository;

  GetLoginUserInfo(this._repository);

  Future<User> execute() async {
    return await _repository.getUser();
  }
}
