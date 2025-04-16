import 'package:json_annotation/json_annotation.dart';

import 'recipe_dto.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final int? id;
  final String? account;
  final String? password;
  final String? username;
  final String? job;
  final String? profileImgUrl;
  final String? profileDescription;
  final String? address;
  final List<RecipeDto>? recipes;
  final List<int>? bookmarkedRecipeIds;
  final int? followersCount;
  final int? followingsCount;

  UserDto({
    this.id,
    this.account,
    this.password,
    this.username,
    this.job,
    this.profileImgUrl,
    this.profileDescription,
    this.address,
    this.recipes,
    this.bookmarkedRecipeIds,
    this.followersCount,
    this.followingsCount,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
