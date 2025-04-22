import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_screen_state.freezed.dart';

@freezed
class FilterScreenState with _$FilterScreenState {
  final List<String> timeList;
  final List<String> categoryList;
  final int rate;
  final String selectedTime;
  final String selectedCategory;
  final String selectedRate;

  const FilterScreenState({
    this.timeList = const ['All', '10', '15', '20', '30', '40'],
    this.categoryList = const [
      'All',
      'Cereal',
      'Vegetables',
      'Dinner',
      'Breakfast',
      'Chinese',
      'Local Dish',
      'Fruit',
      'Spanish',
      'Lunch',
      'Korean',
    ],
    this.rate = 5,
    this.selectedTime = 'All',
    this.selectedCategory = 'All',
    this.selectedRate = '1',
  });
}
