import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class User with _$User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String job;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.job,
  });
}
