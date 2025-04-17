import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class User with _$User {
  final String name;
  final String id;

  const User({
    required this.name,
    required this.id,
  });
}