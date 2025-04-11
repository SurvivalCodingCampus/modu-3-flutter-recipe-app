import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
abstract class Media with _$Media {
  const factory Media({
    @Default('') final String imageId,
    @Default('') final String thumbNailUrl,
    @Default('') final String imageUrl,
    @Default('') final String recipeVideoUrl,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
