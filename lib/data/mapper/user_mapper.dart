// File: user_mapper.dart

import 'package:recipe_app/data/dto/user_dto.dart';
import 'package:recipe_app/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/domain/model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      id: id ?? -1,
      account: account ?? '',
      password: password ?? '',
      username: username ?? '',
      job: job ?? '',
      profileImgUrl: profileImgUrl ?? '',
      profileDescription: profileDescription ?? '',
      address: address ?? '',
      recipes: recipes?.map((e) => e.toRecipe()).toList() ?? [],
      bookmarkedRecipeIds: bookmarkedRecipeIds ?? [],
      followersCount: followersCount ?? 0,
      followingsCount: followingsCount ?? 0,
    );
  }
}

extension UserDtoMapper on User {
  UserDto toDto() {
    return UserDto(
      id: id,
      account: account,
      password: password,
      username: username,
      job: job,
      profileImgUrl: profileImgUrl,
      profileDescription: profileDescription,
      address: address,
      recipes: recipes.map((e) => e.toDto()).toList(),
      bookmarkedRecipeIds: bookmarkedRecipeIds,
      followersCount: followersCount,
      followingsCount: followingsCount,
    );
  }
}
