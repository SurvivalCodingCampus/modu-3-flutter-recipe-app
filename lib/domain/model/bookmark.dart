import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Bookmark with _$Bookmark {
  final int userId;
  final List<int> recipesId;

  Bookmark({required this.userId, required this.recipesId});
}
