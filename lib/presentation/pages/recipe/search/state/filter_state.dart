// ignore_for_file: public_member_api_docs, sort_constructors_first
class FilterState {
  final String time;
  final int rate;
  final String category;

  const FilterState({this.time = 'All', this.rate = 0, this.category = 'All'});

  FilterState copyWith({String? time, int? rate, String? category}) {
    return FilterState(
      time: time ?? this.time,
      rate: rate ?? this.rate,
      category: category ?? this.category,
    );
  }
}
