import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/buttons/box_icon_button.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet.dart';
import 'package:recipe_app/presentation/component/form/search_bar.dart';
import 'package:recipe_app/presentation/component/search_recipe_card.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/ui/ui.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel..fetchAll(),
      builder: (context, child) {
        if (viewModel.state.isLoading) {
          return buildScaffold(
            context,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              const CircularProgressIndicator(),
            ],
          );
        }

        if (viewModel.state.query == '') {
          return buildScaffold(
            context,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Search', style: TextStyles.normalTextBold),
                ],
              ),
              GridView.builder(
                itemCount: viewModel.state.recipes.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final recipe = viewModel.state.recipes[index];
                  return SearchRecipeCard(
                    author: recipe.chef,
                    title: recipe.name,
                    imagePath: recipe.imageUrl,
                    rating: recipe.rating.toInt(),
                  );
                },
              ),
            ],
          );
        }

        return buildScaffold(
          context,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recent Search', style: TextStyles.normalTextBold),
                Text(
                  '${viewModel.state.recipes.length} results',
                  style: TextStyles.smallTextRegular.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
              ],
            ),
            GridView.builder(
              itemCount: viewModel.state.recipes.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                final recipe = viewModel.state.recipes[index];
                return SearchRecipeCard(
                  author: recipe.chef,
                  title: recipe.name,
                  imagePath: recipe.imageUrl,
                  rating: recipe.rating.toInt(),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Scaffold buildScaffold(
    BuildContext context, {
    required List<Widget> children,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipes', style: TextStyles.mediumTextBold),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            spacing: 20,
            children: [
              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: SearchInput(
                      hintText: 'Search recipe',
                      onSubmitted: (String query) {
                        viewModel.searchRecipes(query.trim());
                      },
                    ),
                  ),
                  BoxIconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return FilterSearchBottomSheet(
                            state: viewModel.state.bottomSheetFilter,
                            onApply: (FilterSearchBottomSheetState state) {
                              viewModel.setSearchFilter(state);
                            },
                          );
                        },
                      );
                    },
                    icon: Icons.tune,
                  ),
                ],
              ),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
