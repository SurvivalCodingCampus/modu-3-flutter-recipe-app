import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/filter_dialog.dart';

import 'package:recipe_app/presentation/component/filter_icon_button.dart';
import 'package:recipe_app/presentation/component/grid_recipe_card.dart';
import 'package:recipe_app/presentation/component/search_text_field.dart';
import 'package:recipe_app/presentation/search/search_view_model.dart';
import 'package:recipe_app/ui/ui.dart';

class SearchScreen extends StatefulWidget {
  final SearchViewModel viewModel;

  const SearchScreen({super.key, required this.viewModel});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getRecentSearchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.white,
        surfaceTintColor: ColorStyles.white,
        title: const Text('Search recipes', style: TextStyles.mediumTextBold),
        centerTitle: true,
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 17),
                Row(
                  children: [
                    Flexible(
                      child: SearchTextField(
                        placeholder: 'Search recipe',
                        onValueChanged: (value) {
                          widget.viewModel.getSearchedRecipes(value);
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    FilterIconButton(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return FilterDialog(
                              filter: widget.viewModel.state.filter,
                              onTapFilter: (filter) {
                                widget.viewModel.getFilteredRecipes(filter);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      widget.viewModel.state.title,
                      style: TextStyles.normalTextBold,
                    ),
                    const Spacer(),
                    Text(
                      widget.viewModel.state.resultsCount,
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: ColorStyles.gray3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                        ),
                    itemBuilder: (context, index) {
                      return GridRecipeCard(
                        recipe: widget.viewModel.state.recipes[index],
                      );
                    },
                    itemCount: widget.viewModel.state.recipes.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
