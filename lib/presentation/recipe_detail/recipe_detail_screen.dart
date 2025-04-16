import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/detail_recipe_card.dart';

import '../../data/data_source/recipe/recipe_data_source_impl.dart';
import '../bookmark_recipe/bookmark_repository_impl.dart';
import '../saved_recipe/get_saved_recipe_use_case.dart';
import '../saved_recipe/saved_recipe_view_model.dart';

void main() {
  final dts = RecipeDataSourceImpl();
  final rp = BookmarkRepositoryImpl(dts);
  final uc = GetSavedRecipeUseCase(rp);
  final viewModel = SavedRecipeViewModel(uc);

  runApp(
    MaterialApp(home: Scaffold(body: RecipeDetailScreen(viewModel: viewModel))),
  );
}


class RecipeDetailScreen extends StatefulWidget {
  final SavedRecipeViewModel viewModel;

  const RecipeDetailScreen({super.key, required this.viewModel});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {

  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchSavedRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, index) {
        if (widget.viewModel.isLoading) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: DetailRecipeCard(
              recipe: widget.viewModel.recipes,
              viewModel: widget.viewModel
            ),
          ),
        );
      }
    );
  }
}
