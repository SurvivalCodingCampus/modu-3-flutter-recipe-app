import 'package:recipe_app/data/dto/pictures_dto.dart';
import 'package:recipe_app/domain/model/pictures.dart';

extension PictureMapper on PicturesDto {
  Pictures toPictures() {
    return Pictures(
      id: id as int,
      imageUrl: imageUrl ?? '',
      thumbnailUrl: thumbnailUrl ?? '',
      videoUrl: videoUrl ?? '',
    );
  }
}
