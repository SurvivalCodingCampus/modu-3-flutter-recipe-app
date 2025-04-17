import 'package:flutter/material.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

class HomeViewModel extends ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final UserRepository _userRepository;

  // 상태
  HomeState _state = const HomeState();

  HomeState get state => _state;

  HomeViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required UserRepository userRepository,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _userRepository = userRepository;

  Future<void> fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final user = await _userRepository.getUser();

    _state = state.copyWith(
      user: user,
      recipes: await _getSavedRecipesUseCase.execute(),
      isLoading: false,
    );
    notifyListeners();
  }
}
