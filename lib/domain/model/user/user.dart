// [User] 사용자 정보를 담고 있습니다.
// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class User with _$User {
  final int id;
  final String userId;
  final String name;
  final String email;
  final String? password;
  final String address;
  final String? imageUrl;

  User({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.address,
    required this.password,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
