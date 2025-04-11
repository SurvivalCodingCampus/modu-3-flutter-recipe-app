class Picture {
  final num? id;
  final String? imageUrl;
  final String? thumbnailUrl;
  final String? videoUrl;

  Picture({this.id, this.imageUrl, this.thumbnailUrl, this.videoUrl});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: json['id'] as num?,
      imageUrl: json['imageUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
    );
  }
}
