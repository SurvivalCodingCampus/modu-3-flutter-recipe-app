import 'package:recipe_app/data/dto/bookmark_dto.dart';
import 'package:recipe_app/domain/model/bookmark.dart';

extension BookmarkMapper on BookmarkDto {
  Bookmark toBookmark() {
    return Bookmark(userId: userId, recipesId: recipesId);
  }
}
