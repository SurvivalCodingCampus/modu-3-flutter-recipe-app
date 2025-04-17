import 'package:freezed_annotation/freezed_annotation.dart';

part 'chef.freezed.dart';

part 'chef.g.dart';

@freezed
abstract class Chef with _$Chef {
  const factory Chef({
    required int id,
    required String name,
    required String image,
    required String address,
  }) = _Chef;

  factory Chef.fromJson(Map<String, Object?> json) => _$ChefFromJson(json);
}