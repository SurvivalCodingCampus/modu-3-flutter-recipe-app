import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/type/category_filter_type.dart';

part 'recipe.freezed.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String name,
    required int estimatedTime,
    required bool isFavorite,
    required double rate,
    required String makeUserName,
    required String makeUserImageUrl,
    String? videoUrl,
    required String imageUrl,
    required DateTime createdAt,
    required CategoryFilterType category,
  }) = _Recipe;

  static final empty = Recipe(
    id: '',
    name: '',
    estimatedTime: 0,
    isFavorite: false,
    rate: 0.0,
    makeUserName: '',
    makeUserImageUrl: '',
    imageUrl: '',
    createdAt: DateTime.fromMicrosecondsSinceEpoch(0), // 기본 날짜 사용
    category: CategoryFilterType.all, // 기본 카테고리
  );

  static const dummyImageUrl = 'https://cdn.pixabay.com/photo/2017/01/26/02/06/christmas-wallpaper-2009590_1280.jpg';
}