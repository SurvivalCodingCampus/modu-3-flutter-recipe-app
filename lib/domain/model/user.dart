import 'package:freezed_annotation/freezed_annotation.dart';

import 'recipe.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User({
    required this.id,
    required this.account,
    required this.password,
    required this.username,
    required this.job,
    required this.profileImgUrl,
    required this.profileDescription,
    required this.address,
    required this.recipes,
    required this.bookmarkedRecipeIds,
    required this.followersCount,
    required this.followingsCount,
  });

  final int id;
  final String account;
  final String password;
  final String username;
  final String job;
  final String profileImgUrl;
  final String profileDescription;
  final String address;
  final List<Recipe> recipes;
  final List<int> bookmarkedRecipeIds;
  final int followersCount;
  final int followingsCount;
}
