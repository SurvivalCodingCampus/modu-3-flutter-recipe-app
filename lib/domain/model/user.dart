import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable()
class User with _$User{
  final int id;
  final String name;
  final String image;
  final String address;
  final List<int> bookmarks;

  const User({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.bookmarks
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  // final String email;
  // final String password;
  // final String job;
  // final String introduce;
  // final List<int> recipes;
  // final List<String> follower;
  // final List<String> following;
  // final List<int> notifications;
}