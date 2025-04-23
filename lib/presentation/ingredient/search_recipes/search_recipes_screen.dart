import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/presentation/component/filter_search_sheet/filter_search_bottom_sheet.dart';
import 'package:recipe_app/presentation/component/filter_search_sheet/filter_search_state.dart';
import 'package:recipe_app/presentation/component/input_field_widget.dart';
import 'package:recipe_app/presentation/component/recipe_card_search.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_state.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_view_model.dart';

class SearchRecipesScreen extends StatelessWidget {
  final void Function(SearchRecipesAction action) onAction;
  final SearchRecipesState state;

  const SearchRecipesScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search recipes', style: TextStyles.mediumBold()),
          centerTitle: true,
          backgroundColor: ColorStyles.white,
        ),
        backgroundColor: ColorStyles.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: InputFieldWidget(
                        placeHolder: 'Search recipe',
                        icon: Icon(
                          Icons.search_outlined,
                          color: ColorStyles.gray4,
                          size: 30,
                        ),
                        onValueChange: (String value) {
                          onAction(SearchRecipesAction.onSearch(value));
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder:
                            (_) => Container(
                              height: MediaQuery.sizeOf(context).height * 0.6,
                              decoration: BoxDecoration(
                                color: ColorStyles.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: FilterSearchBottomSheet(
                                  state: state.filterSearchState,
                                  onFilterChange: (
                                    FilterSearchState filterSearchState,
                                  ) {
                                    onAction(SearchRecipesAction.onSetFilter(filterSearchState));
                                  },
                                ),
                              ),
                            ),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorStyles.primary100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.tune,
                        size: 30,
                        color: ColorStyles.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.searchString.isNotEmpty
                          ? 'Search Result'
                          : 'Recent Search',
                      style: TextStyles.largeBold(),
                    ),
                    Text(
                      state.searchString.isNotEmpty
                          ? '${state.searchRecipes.length} result'
                          : '',
                      style: TextStyles.smallRegular(color: ColorStyles.gray3),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children:
                      state.searchRecipes
                          .map(
                            (recipe) => RecipeCardSearch(
                              recipe: recipe,
                              onClick: () {},
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
