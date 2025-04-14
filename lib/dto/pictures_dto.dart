class PicturesDto {
  final num? id;
  final String? imageUrl;
  final String? thumbnailUrl;
  final String? videoUrl;

  PicturesDto({this.id, this.imageUrl, this.thumbnailUrl, this.videoUrl});

  factory PicturesDto.fromJson(Map<String, dynamic> json) {
    return PicturesDto(
      id: json['id'] as num?,
      imageUrl: json['imageUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
    );
  }
}
