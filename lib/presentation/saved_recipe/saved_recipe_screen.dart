import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_state.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';

import '../../core/di/di.dart';
import '../../data/data_source/chef/chef_data_source_impl.dart';
import '../../data/data_source/procedure/procedure_data_source_impl.dart';
import '../../data/repository/chef/chef_repository_impl.dart';
import '../../data/repository/procedure/procedure_repository_impl.dart';
import '../recipe_detail/recipe_detail_screen.dart';
import '../recipe_detail/recipe_detail_view_model.dart';

void main() {
  final viewModel = getIt<SavedRecipeViewModel>();

  runApp(
    MaterialApp(home: Scaffold(body: SavedRecipeScreen(viewModel: viewModel))),
  );
}

class SavedRecipeScreen extends StatelessWidget {
  final SavedRecipeViewModel viewModel;

  SavedRecipeScreen({super.key, required this.viewModel}) {
    viewModel.fetchSavedRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        if (viewModel.isLoading) {
          return Scaffold(
            appBar: AppBar(title: Text('Saved recipes'), centerTitle: true),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(title: Text('Saved recipes'), centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return RecipeCard(
                  recipe: viewModel.recipes[index],
                  onBookmarkTap: () {
                    viewModel.removeRecipeIds(viewModel.recipes[index].id);
                  },
                  onTapImage: () {
                    final detailState = RecipeDetailState(
                      recipe: viewModel.recipes[index],
                      procedure: [],
                      isLoading: true
                    );
                    // final detailViewModel = RecipeDetailViewModel(
                    //   chefRepository: ChefRepositoryImpl(ChefDataSourceImpl()),
                    //   procedureRepository: ProcedureRepositoryImpl(ProcedureDataSourceImpl()),
                    //   state: detailState,
                    // );
                    final detailViewModel = getIt<RecipeDetailViewModel>(param1: detailState);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RecipeDetailScreen(
                          viewModel: detailViewModel,
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 1);
              },
              itemCount: viewModel.recipes.length,
            ),
          ),
        );
      },
    );
  }
}
