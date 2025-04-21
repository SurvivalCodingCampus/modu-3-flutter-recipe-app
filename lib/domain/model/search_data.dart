import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_data.freezed.dart';

@freezed
class SearchData with _$SearchData {
  final String? query;
  final int? rate;
  final List<String>? categories;

  SearchData({
    required this.query,
    required this.rate,
    required this.categories,
  });
}
