import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Picture with _$Picture {
  final int id;
  final String imageUrl;
  final String thumbnailUrl;
  final String videoUrl;

  Picture({
    required this.id,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.videoUrl,
  });
}
