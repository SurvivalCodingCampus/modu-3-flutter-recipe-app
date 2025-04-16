import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
abstract class Review with _$Review {
  const factory Review({
    @Default('') final String recipeId,
    @Default('') final String reviewId,
    @Default(0) final int goodCount,
    @Default(0) final int badCount,
    @Default(null) final DateTime? createdAt,
    @Default('') final String userId,
    @Default('') final String comment,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
