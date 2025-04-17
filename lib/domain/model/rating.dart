import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';

@freezed
class Rating with _$Rating {
  final String title;
  final String actionName;
  final void Function(int) onChange;

  const Rating({
    required this.title,
    required this.actionName,
    required this.onChange,
  });
}