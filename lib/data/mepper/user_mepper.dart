import 'package:recipe_app/data/dto/user_dto.dart';
import 'package:recipe_app/domain/model/user/user.dart';

extension UserMepper on UserDto {
  User toUser() {
    return User(
      id: id ?? -1,
      userId: userId ?? '',
      name: name ?? '',
      email: email ?? '',
      address: address ?? '',
      password: password ?? '',
      imageUrl: image ?? '',
    );
  }
}
