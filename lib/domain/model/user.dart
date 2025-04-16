import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @Default(0) final int id,
    @Default('') final String name,
    @Default('') final String image,
    @Default('') final String address,
    @Default([]) final List<int> bookMarkList,
    @Default('') final String email,
    @Default('') final String introduction,
    @Default('') final String job,
    @Default({}) final Set<String> followingUserIds,
    @Default({}) final Set<String> followerUserIds,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
