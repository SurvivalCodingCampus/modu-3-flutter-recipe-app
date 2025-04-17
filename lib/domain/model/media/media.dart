// [Media] 사진과 영상등 레시피에 필요한 정보를 담고 있습니다.
// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Media with _$Media {
  final String imageId;
  final String thumbNailUrl;
  final String imageUrl;
  final String recipeVideoUrl;
  Media({
    required this.imageId,
    required this.thumbNailUrl,
    required this.imageUrl,
    required this.recipeVideoUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
