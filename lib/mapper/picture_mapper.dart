import 'package:recipe_app/dto/pictures_dto.dart';
import 'package:recipe_app/data/model/pictures.dart';

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
