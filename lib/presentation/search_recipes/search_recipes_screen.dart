import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/component/filter_list.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesState state;
  final void Function(SearchRecipesAction action) onAction;
  const SearchRecipesScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Search recipes", style: TextStyles.mediumTextBold),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 260,
                      child: InputField(
                        label: '',
                        placeHolder: 'Search recipe',
                        isSearch: true,
                        controller: TextEditingController(text: ''),
                        onValueChange: (String value) async {
                          widget.onAction(
                            SearchRecipesAction.onValueChange(value),
                          );
                        },
                        onTap: () {},
                      ),
                    ),
                    FilterList(
                      ontap: () {
                        widget.onAction(SearchRecipesAction.onFilterTap());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.state.isSearched
                          ? "Search Result"
                          : "Recent Search",
                      style: TextStyles.normalTextBold,
                    ),
                    Text(
                      widget.state.isSearched
                          ? "${widget.state.recipeList.length} results"
                          : "",
                      style: TextStyles.smallTextRegular.copyWith(
                        color: ColorStyles.gray3,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: widget.state.recipeList.length,
                  itemBuilder: (context, index) {
                    List<Recipe> recipes = widget.state.recipeList;
                    if (recipes.isEmpty) {
                      return null;
                    }
                    return RecipeCard(
                      recipe: recipes[index],
                      isBig: false,
                      isBookmarked: true,
                      isIngredient: false,
                      bookMarkCallback: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
