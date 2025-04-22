import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/filter_small_button.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/recipe_card.dart';
import '../filter_screen/filter_screen.dart';
import '../filter_screen/filter_screen_view_model.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel viewModel;
  final FilterScreenViewModel filterScreenViewModel;

  const SearchRecipesScreen({
    super.key,
    required this.viewModel,
    required this.filterScreenViewModel,
  });

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.restoreLastSearch();
  }

  @override
  void dispose() {
    widget.viewModel.resetFilters();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () => context.pop(),
        ),
        title: const Text('Search recipes'),
        centerTitle: true,
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          final state = widget.viewModel.state;
          final isFiltered = state.isFiltered;

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.recipes.isEmpty) {
            return const Center(child: Text('No recipes found.'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 45),
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
                            contentPadding: const EdgeInsets.all(10),
                          ),
                          onChanged: widget.viewModel.updateKeyword,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    FilterSmallButton(
                      onTap: () async {
                        final result = await showModalBottomSheet<FilterResult>(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50),
                            ),
                          ),
                          builder:
                              (context) => FilterScreen(
                                viewModel: widget.filterScreenViewModel,
                              ),
                        );

                        if (result != null) {
                          widget.viewModel.updateFilters(
                            time: result.time,
                            rate: result.rate,
                            category: result.category,
                          );
                        }
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Text(
                      state.keyword.isNotEmpty
                          ? 'Search Result'
                          : 'Recent Search',
                      style: TextStyles.normalBold.copyWith(fontSize: 16),
                    ),
                    const Spacer(),
                    Text(
                      state.keyword.isNotEmpty
                          ? '${state.filteredRecipes.length} results'
                          : '',
                      style: TextStyles.normalRegular.copyWith(
                        fontSize: 11,
                        color: ColorStyles.gray3,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.0,
                  ),
                  itemCount:
                      isFiltered
                          ? state.filteredRecipes.length
                          : state.recipes.length,
                  itemBuilder: (context, index) {
                    final recipe =
                        isFiltered
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
