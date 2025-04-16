

import 'package:flutter/cupertino.dart';
import 'package:recipe_app/data/repository/chef/chef_repository.dart';
import 'package:recipe_app/data/repository/procedure/procedure_repository.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_state.dart';

class RecipeDetailViewModel with ChangeNotifier {
  final ChefRepository _chefRepository;
  final ProcedureRepository _procedureRepository;

  RecipeDetailState _state;
  RecipeDetailState get state => _state;

  RecipeDetailViewModel({
    required ChefRepository chefRepository,
    required ProcedureRepository procedureRepository,
    required RecipeDetailState state,
  }) : _chefRepository = chefRepository,
       _procedureRepository = procedureRepository,
       _state = state;

  Future<void> fetchAll() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final chefs = await _chefRepository.getChefProfiles();
    final chef = chefs.firstWhere((e) => e.name == _state.recipe.chef);

    final procedures = await _procedureRepository.getProcedure();
    final procedure = procedures.where((e) => e.recipeId == _state.recipe.id).toList();

    _state = _state.copyWith(
      chef: chef,
      procedure: procedure,
      isLoading: false,

    );
    notifyListeners();

  }

}