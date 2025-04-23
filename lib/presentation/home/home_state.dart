import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  @override
  final List<String> categories;
  @override
  final String category;
  @override
  final List<Recipe> recipes;

  const HomeState({
    this.categories = const [],
    this.category = 'All',
    this.recipes = const [],
  });
}
