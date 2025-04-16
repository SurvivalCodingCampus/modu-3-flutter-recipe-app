import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure.freezed.dart';

@freezed
abstract class Procedure with _$Procedure {
  const factory Procedure({
    required List<String> descriptions,
  }) = _Procedure;

  static const empty = Procedure(descriptions: []);
}