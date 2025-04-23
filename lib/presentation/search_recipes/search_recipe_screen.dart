

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/search_recipe_card.dart';
import 'package:recipe_app/presentation/component/search_text_filter.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipe_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipe_state.dart';


class SearchRecipeScreen extends StatefulWidget {
  final SearchRecipeState state;
  // final VoidCallback onFetchAll;
  // final void Function(String) onKeywordChanged;
  final void Function(SearchRecipeAction action) onAction;

  const SearchRecipeScreen({super.key, required this.state, required this.onAction,});

  @override
  State<SearchRecipeScreen> createState() => _SearchRecipeScreenState();
}

class _SearchRecipeScreenState extends State<SearchRecipeScreen> {

  @override
  void initState() {
    super.initState();
    widget.onAction(SearchRecipeAction.onFetchAll());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state.isLoading) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Search recipes'), centerTitle: true,),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final searching = widget.state.keyword.isNotEmpty;
    final recipeList = searching ? widget.state.filterRecipes : widget.state.recipes;

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
            SearchTextFilter(
              state: widget.state,
              onKeywordChanged: (keyword) {
                widget.onAction(SearchRecipeAction.onKeywordChanged(keyword));
              },
            ),
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
}
