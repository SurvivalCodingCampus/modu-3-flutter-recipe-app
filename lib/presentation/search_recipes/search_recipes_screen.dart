import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/filter_small_button.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/filter_button.dart';
import '../component/pushed_button/small_tap_button.dart';
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
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 45),
                        child: TextField(
                          style: TextStyles.smallerRegular.copyWith(
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: 'Search recipe',
                            hintStyle: TextStyles.smallerRegular.copyWith(
                              color: ColorStyles.gray4,
                              fontSize: 11,
                            ),
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
                            contentPadding: EdgeInsets.all(10),
                          ),
                          onChanged: (value) {
                            widget.viewModel.updateKeyword(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        widget.viewModel.fetchSearchRecipes();
                      },
                      child: FilterSmallButton(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50),
                              ),
                            ),
                            builder: (context) {
                              return Container(
                                height: 450,
                                width: double.infinity,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: ColorStyles.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(50),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Filter Search',
                                        style: TextStyles.smallBold.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                            right: 30,
                                            bottom: 10,
                                          ),
                                          child: Text(
                                            'Time',
                                            style: TextStyles.smallBold
                                                .copyWith(fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: FilterButton(
                                            text: [
                                              'All',
                                              'Newest',
                                              'Oldest',
                                              'Popularity',
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                            right: 30,
                                            bottom: 10,
                                            top: 10,
                                          ),
                                          child: Text(
                                            'Rate',
                                            style: TextStyles.smallBold
                                                .copyWith(fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: RatingButton(rate: 5),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                            right: 30,
                                            bottom: 10,
                                            top: 10,
                                          ),
                                          child: Text(
                                            'Category',
                                            style: TextStyles.smallBold
                                                .copyWith(fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: FilterButton(
                                            text: [
                                              'All',
                                              'Cereal',
                                              'Vegetables',
                                              'Dinner',
                                              'Breakfast',
                                              'Chinese',
                                              'Local Dish',
                                              'Fruit',
                                              'Spanish',
                                              'Lunch',
                                              'Korean',
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: 30,
                                          bottom: 10,
                                        ),
                                        child: SmallTapButton(text: 'Filter'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
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
