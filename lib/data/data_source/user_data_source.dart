import 'package:recipe_app/data/dto/user_dto.dart';

abstract interface class UserDataSource {
  // 모든 유저 정보 가져오기
  Future<List<UserDto>> getUserDtos();
  // 유저 정보 가져오기
  Future<UserDto> getUserDto(String userName);
}
