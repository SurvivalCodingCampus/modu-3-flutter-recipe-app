import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/components/f_filter_buttons.dart';
import 'package:recipe_app/presentation/components/f_input_field.dart';
import 'package:recipe_app/presentation/components/f_search_filter_button.dart';
import 'package:recipe_app/presentation/components/f_small_button.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_state.dart';
import 'package:recipe_app/presentation/search_recipes/recipe_grid_view.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({super.key, required this.viewModel});

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.getSavedRecentRecipes();
  }

  @override
  void dispose() {
    super.dispose();
    _searchFocusNode.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, snapshot) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 38,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.black,
                            size: 24,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Search recipes',
                            style: TextStyles.mediumTextBold(
                              color: AppColors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(width: 24),
                      ],
                    ),
                  ),

                  const SizedBox(height: 17),
                  _buildSearchBarArea(context),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Text(
                        widget.viewModel.searchRecipesMainState.query.isEmpty
                            ? 'Recent Search'
                            : 'Search Result',
                        style: TextStyles.mediumTextBold(
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),

                      Spacer(),

                      if (widget
                          .viewModel
                          .searchRecipesMainState
                          .query
                          .isNotEmpty)
                        Text(
                          '${widget.viewModel.searchRecipesMainState.searchRecipes.length} results',
                          style: TextStyles.smallerTextRegular(
                            color: AppColors.gray3,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  if (widget
                      .viewModel
                      .searchRecipesMainState
                      .searchRecipes
                      .isEmpty)
                    Expanded(
                      child: Center(
                        child: Text(
                          '레시피가 없습니다.',
                          style: TextStyles.mediumTextRegular(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    )
                  else
                    RecipeGridView(
                      viewModel: widget.viewModel,
                      onRecipeTap: (recipe) {
                        print('레시피 누름: ${recipe.name}');
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Row _buildSearchBarArea(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Expanded(
          child: FInputField(
            placeHolder: 'Search recipe ',
            value: widget.viewModel.searchRecipesMainState.query,
            isVisibleSearchIcon: true,
            onValueChange: (value) {
              widget.viewModel.fetchSearchRecipesByQuery(query: value);
            },
            searchController: _searchController,
            focusNode: _searchFocusNode,
          ),
        ),
        FSearchFilterButton(
          voidCallback: () {
            _buildShowModalBottomSheet(context, (state) {
              widget.viewModel.applyFilters(state.copyWith());
            });
          },
        ),
      ],
    );
  }

  Future<dynamic> _buildShowModalBottomSheet(
    BuildContext context,
    void Function(FilterSearchState) onFilterApply,
  ) {
    FilterSearchState filterSearchState = widget.viewModel.filterSearchState;

    return showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  'Filter Search',
                  style: TextStyles.smallTextBold(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Time',
                    style: TextStyles.smallTextBold(color: AppColors.black),
                  ),
                ),
                SizedBox(height: 10),
                IntrinsicHeight(
                  child: FFilterButtons(
                    allFilters:
                        filterSearchState.timeFilterTypes
                            .map((e) => e.name)
                            .toList(),
                    onTap: (index) {
                      setState(() {
                        filterSearchState = filterSearchState.copyWith(
                          selectedTimeFilterType:
                              filterSearchState.timeFilterTypes[index],
                        );
                      });
                    },
                    hasStars:
                        filterSearchState.timeFilterTypes
                            .map((e) => e.hasStar)
                            .toList(),
                    beforeSelectedIndex:
                        filterSearchState.selectedTimeFilterType.index,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Rate',
                    style: TextStyles.smallTextBold(color: AppColors.black),
                  ),
                ),
                SizedBox(height: 10),
                IntrinsicHeight(
                  child: FFilterButtons(
                    allFilters:
                        filterSearchState.rateTypes.map((e) => e.name).toList(),
                    onTap: (index) {
                      setState(() {
                        filterSearchState = filterSearchState.copyWith(
                          selectedRateType: filterSearchState.rateTypes[index],
                        );
                      });
                    },
                    hasStars:
                        filterSearchState.rateTypes
                            .map((e) => e.hasStar)
                            .toList(),
                    beforeSelectedIndex:
                        filterSearchState.selectedRateType.index,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Category',
                    style: TextStyles.smallTextBold(color: AppColors.black),
                  ),
                ),
                SizedBox(height: 10),
                IntrinsicHeight(
                  child: FFilterButtons(
                    allFilters:
                        filterSearchState.categoryFilterTypes
                            .map((e) => e.name)
                            .toList(),
                    onTap: (index) {
                      setState(() {
                        filterSearchState = filterSearchState.copyWith(
                          selectedCategoryFilterType:
                              filterSearchState.categoryFilterTypes[index],
                        );
                      });
                    },
                    hasStars:
                        filterSearchState.categoryFilterTypes
                            .map((e) => e.hasStar)
                            .toList(),
                    beforeSelectedIndex:
                        filterSearchState.selectedCategoryFilterType.index,
                  ),
                ),
                SizedBox(height: 20),
                FSmallButton(
                  text: 'Filter',
                  voidCallback: () {
                    widget.viewModel.applyFilters(filterSearchState);
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
