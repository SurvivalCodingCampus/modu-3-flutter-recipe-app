import 'package:recipe_app/domain/model/user/user.dart';

// [Review] 레시피게시글 댓글정보를 담고 있습니다.
// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Review with _$Review {
  final int recipeId;
  final int reviewId;
  final int goodCount;
  final int badCount;
  final DateTime createdAt;
  final User user;
  final String comment;
  Review({
    required this.recipeId,
    required this.reviewId,
    required this.goodCount,
    required this.badCount,
    required this.createdAt,
    required this.user,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
