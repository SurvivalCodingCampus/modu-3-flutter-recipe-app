import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/filter_small_button.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/recipe_card.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({super.key, required this.viewModel});

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchSearchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search recipes'), centerTitle: true),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (BuildContext context, Widget? child) {
          final state = widget.viewModel.state;
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.recipes.isEmpty) {
            return Center(child: Text('No recipes found.'));
          }
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search recipe',
                          prefixIcon: Icon(
                            Icons.search,
                            color: ColorStyles.gray4,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorStyles.gray4,
                              width: 1.3,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorStyles.gray4,
                              width: 1.3,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          widget.viewModel.updateKeyword(value);
                        },
                      ),
                    ),
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        widget.viewModel.fetchSearchRecipes();
                      },
                      child: FilterSmallButton(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      widget.viewModel.state.keyword.isNotEmpty
                          ? 'Search Result'
                          : 'Recent Search',
                      style: TextStyles.normalBold.copyWith(fontSize: 16),
                    ),
                    SizedBox(width: 190),
                    Text(
                      widget.viewModel.state.keyword.isNotEmpty
                          ? '${state.filteredRecipes.length} results'
                          : '',
                      style: TextStyles.normalRegular.copyWith(
                        fontSize: 11,
                        color: ColorStyles.gray3,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.0,
                  ),
                  itemCount:
                      state.keyword.isNotEmpty
                          ? state.filteredRecipes.length
                          : state.recipes.length,
                  itemBuilder: (context, index) {
                    final recipe =
                        state.keyword.isNotEmpty
                            ? state.filteredRecipes[index]
                            : state.recipes[index];
                    return RecipeCard(
                      recipe: recipe,
                      showBookMarked: false,
                      showTitle: true,
                      height: 200,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
