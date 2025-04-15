

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/search_recipe_card.dart';
import 'package:recipe_app/presentation/component/search_text_filter.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipe_view_model.dart';

import '../../data/data_source/recipe/recipe_data_source_impl.dart';
import '../../data/repository/recipe_repository_impl.dart';

void main() {
  final dts = RecipeDataSourceImpl();
  final rp = RecipeRepositoryImpl(dts);
  final viewModel = SearchRecipeViewModel(rp);

  runApp(
      MaterialApp(
        home: Scaffold(
          body: SearchRecipeScreen(viewModel: viewModel),
        ),
      )
  );
}

class SearchRecipeScreen extends StatefulWidget {
  final SearchRecipeViewModel viewModel;

  const SearchRecipeScreen({super.key, required this.viewModel});

  @override
  State<SearchRecipeScreen> createState() => _SearchRecipeScreenState();
}

class _SearchRecipeScreenState extends State<SearchRecipeScreen> {

  @override
  void initState() {
      super.initState();
      widget.viewModel.fetchAll();
   }

  @override
  Widget build(BuildContext context) {

    return ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          if (widget.viewModel.state.isLoading) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(title: Text('Search recipes'), centerTitle: true,),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final searching = widget.viewModel.state.keyword.isNotEmpty;
          final recipeList = searching ? widget.viewModel.state.filterRecipes : widget.viewModel.state.recipes;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Search recipes'),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SearchTextFilter(viewModel: widget.viewModel),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child : recipeList.isEmpty
                      ? Center(
                        child: Text(
                          '검색 결과가 없습니다',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                      : GridView.builder(
                      itemCount: recipeList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1 / 1,
                      ),
                      itemBuilder: (context, index) {
                        final recipe = recipeList[index];
                        return SearchRecipeCard(recipe: recipe);
                      },
                    ),
                  ),
                ],
              ),
            )
          );
        }
    );
  }
}
