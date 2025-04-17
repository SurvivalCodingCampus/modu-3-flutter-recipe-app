// [book_mark] 저장된 레시피의 정보를 담고 있습니다.
// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_mark.freezed.dart';
part 'book_mark.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class BookMark with _$BookMark {
  final int id;
  final List<int> bookMarkedRecipesId;

  const BookMark({required this.id, required this.bookMarkedRecipesId});

  factory BookMark.fromJson(Map<String, dynamic> json) =>
      _$BookMarkFromJson(json);
  Map<String, dynamic> toJson() => _$BookMarkToJson(this);
}
