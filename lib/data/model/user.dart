import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @Default('') final String name,
    @Default('') final String userId,
    @Default('') final String email,
    @Default('') final String password,
    @Default('') final String address,
    @Default('') final String introduction,
    @Default('') final String job,
    @Default({}) final Set<User> followingUsers,
    @Default({}) final Set<User> followerUsers,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
