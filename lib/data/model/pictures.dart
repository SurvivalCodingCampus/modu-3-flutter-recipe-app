import 'package:freezed_annotation/freezed_annotation.dart';

part 'pictures.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Pictures with _$Pictures {
  final int id;
  final String imageUrl;
  final String thumbnailUrl;
  final String videoUrl;

  Pictures({
    required this.id,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.videoUrl,
  });
}
