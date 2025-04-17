import 'package:recipe_app/data/dto/user_dto.dart';

abstract interface class AuthDataSource {
  // User정보 가져오기
  Future<UserDto> getUserDto();
}
