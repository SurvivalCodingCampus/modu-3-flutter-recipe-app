class FilterSearchState {
  // 시간 필터 상태
  final List<String> timeOptions = ['All', 'Newest', 'Oldest', 'Popularity'];
  int? selectedTimeIndex;

  // 평점 필터 상태 (5점부터 1점까지)
  final List<int> ratingOptions = [5, 4, 3, 2, 1];
  int? selectedRatingIndex;

  // 카테고리 필터 상태
  final List<String> categoryOptions = [
    'All',
    'Cereal',
    'Vegetables',
    'Dinner',
    'Chinese',
    'Local Dish',
    'Fruit',
    'Breakfast',
    'Spanish',
    'Chinese',
    'Lunch',
  ];
  final List<bool> selectedCategories;

  FilterSearchState()
    : selectedCategories = List.generate(
        11,
        (_) => false,
      ); // 카테고리 옵션 개수에 맞게 초기화

  // 시간 필터 토글
  void toggleTimeFilter(int index) {
    selectedTimeIndex = (selectedTimeIndex == index) ? null : index;
  }

  // 평점 필터 토글
  void toggleRatingFilter(int index) {
    selectedRatingIndex = (selectedRatingIndex == index) ? null : index;
  }

  // 카테고리 필터 토글
  void toggleCategoryFilter(int index) {
    selectedCategories[index] = !selectedCategories[index];
  }

  // 모든 필터 초기화
  void resetFilters() {
    selectedTimeIndex = null;
    selectedRatingIndex = null;
    for (int i = 0; i < selectedCategories.length; i++) {
      selectedCategories[i] = false;
    }
  }

  // FilterSearchState의 getSelectedFilters() 메서드를 확인
  Map<String, dynamic> getSelectedFilters() {
    final Map<String, dynamic> filters = {};

    // 시간 필터
    if (selectedTimeIndex != null) {
      filters['time'] = timeOptions[selectedTimeIndex!];
    }

    // 별점 필터
    if (selectedRatingIndex != null) {
      filters['rating'] = ratingOptions[selectedRatingIndex!];
    }

    // 카테고리 필터
    final List<String> selectedCategoryValues = [];
    for (int i = 0; i < selectedCategories.length; i++) {
      if (selectedCategories[i]) {
        selectedCategoryValues.add(categoryOptions[i]);
      }
    }

    if (selectedCategoryValues.isNotEmpty) {
      filters['categories'] = selectedCategoryValues;
    }

    return filters;
  }
}
