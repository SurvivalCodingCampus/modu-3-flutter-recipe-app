import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:recipe_app/recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/recipe_app/data/model/procedure.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/data/repository/ingredients_repository.dart';
import 'package:recipe_app/recipe_app/domain/use_case/copy_link_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/get_recipe_id_use_case.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_screen_event.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_state.dart';

import '../../domain/use_case/get_procedure_use_case.dart';

class DetailRecipeViewModel with ChangeNotifier {
  final GetRecipeIdUseCase _useCase;
  final GetProcedureUseCase _getProcedureUseCase;
  final IngredientsRepository _ingredientsRepository;
  final CopyLinkUseCase _copyLinkUseCase;

  DetailRecipeViewModel(
    this._copyLinkUseCase, {
    required GetRecipeIdUseCase useCase,
    required GetProcedureUseCase getProcedureUseCase,
    required IngredientsRepository ingredientsRepository,
  }) : _useCase = useCase,
       _getProcedureUseCase = getProcedureUseCase,
       _ingredientsRepository = ingredientsRepository;

  DetailRecipeState _state = const DetailRecipeState();

  DetailRecipeState get state => _state;

  final _eventController = StreamController<DetailRecipeScreenEvent>();

  Stream<DetailRecipeScreenEvent> get eventStream => _eventController.stream;

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }

  Future<Recipe> getRecipeById(int id) async {
    _state = _state.copyWith(isRecipeLoading: true);
    notifyListeners();

    try {
      final recipe = await _useCase.execute(id);
      _state = _state.copyWith(isRecipeLoading: false, recipe: recipe);
      notifyListeners();
      return recipe;
    } catch (e) {
      _state = _state.copyWith(isRecipeLoading: false);
      notifyListeners();
      _eventController.add(
        DetailRecipeScreenEvent.showError("레시피를 불러오지 못했습니다."),
      );
      rethrow;
    }
  }

  Future<List<Ingredient>> getIngredients() async {
    _state = _state.copyWith(isRecipeLoading: true);
    notifyListeners();

    try {
      final ingredients = await _ingredientsRepository.getIngredients();
      _state = _state.copyWith(isRecipeLoading: false, ingredient: ingredients);
      notifyListeners();
      return ingredients;
    } catch (e) {
      _state = _state.copyWith(isRecipeLoading: false);
      notifyListeners();
      _eventController.add(
        DetailRecipeScreenEvent.showError("레시피를 불러오지 못했습니다."),
      );
      rethrow;
    }
  }

  Future<List<Procedure>> getProcedureById(int id) async {
    _state = _state.copyWith(isRecipeLoading: true);
    notifyListeners();

    try {
      final procedure = await _getProcedureUseCase.execute(id);
      _state = _state.copyWith(isRecipeLoading: false, procedure: procedure);
      notifyListeners();

      return procedure;
    } catch (e) {
      _state = _state.copyWith(isRecipeLoading: false);
      notifyListeners();
      _eventController.add(
        DetailRecipeScreenEvent.showError("레시피를 불러오지 못했습니다."),
      );
      rethrow;
    }
  }

  Future<void> copyLink(int id) async {
    _state = _state.copyWith(isRecipeLoading: true);
    notifyListeners();
    try {
      final copyLink = _copyLinkUseCase.copyLink(id);
      _state = _state.copyWith(isRecipeLoading: false);
      notifyListeners();
      return copyLink;
    } catch (e) {
      _state = _state.copyWith(isRecipeLoading: false);
      notifyListeners();
      _eventController.add(
        DetailRecipeScreenEvent.showError("링크를 불러오지 못했습니다."),
      );
      rethrow;
    }
  }

  Future<String> getCopyLink(int id) async {
    _state = _state.copyWith(isRecipeLoading: true);
    notifyListeners();
    try {
      final copyLink = _copyLinkUseCase.getLink(id);
      _state = _state.copyWith(isRecipeLoading: false);
      notifyListeners();
      return copyLink;
    } catch (e) {
      _state = _state.copyWith(isRecipeLoading: false);
      notifyListeners();
      _eventController.add(
        DetailRecipeScreenEvent.showError("링크를 불러오지 못했습니다."),
      );
      rethrow;
    }
  }
}
