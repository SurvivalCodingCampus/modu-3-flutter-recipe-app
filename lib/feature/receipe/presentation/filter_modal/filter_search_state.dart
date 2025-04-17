class FilterSearchState {
  final String time;
  final int rate;
  final String category;

  const FilterSearchState({
    this.time = 'All',
    this.rate = 0,
    this.category = 'All',
  });

  FilterSearchState copyWith({String? time, int? rate, String? category}) {
    return FilterSearchState(
      time: time ?? this.time,
      rate: rate ?? this.rate,
      category: category ?? this.category,
    );
  }
}
