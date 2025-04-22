sealed class SearchAction {
  const factory SearchAction.fetchSearchData() = FetchSearchData;
  const factory SearchAction.filterData({
    required String time,
    required int rate,
    required String category,
  }) = FilterData;
  const factory SearchAction.searchData(String text) = SearchData;
  const factory SearchAction.getRecentSearchText() = GetRecentSearchText;
}

class FetchSearchData implements SearchAction {
  const FetchSearchData();
}

class FilterData implements SearchAction {
  final String time;
  final int rate;
  final String category;

  const FilterData({
    required this.time,
    required this.rate,
    required this.category,
  });
}

class SearchData implements SearchAction {
  final String text;
  const SearchData(this.text);
}

class GetRecentSearchText implements SearchAction {
  const GetRecentSearchText();
}
