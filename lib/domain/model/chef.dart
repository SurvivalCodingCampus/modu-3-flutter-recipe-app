
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chef.freezed.dart';
part 'chef.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable()
class Chef with _$Chef {
  final int id;
  final String name;
  final String image;
  final String address;

  const Chef({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
  });

  factory Chef.fromJson(Map<String, dynamic> json) => _$ChefFromJson(json);
  Map<String, dynamic> toJson() => _$ChefToJson(this);
}