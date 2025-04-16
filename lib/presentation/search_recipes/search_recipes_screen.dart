// Flutter imports:
import 'package:flutter/material.dart';
import 'package:recipe_app/core/error/ui_state.dart';
// Project imports:
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';
import 'package:recipe_app/data/mocks/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_search_bottom_sheet.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_search_state.dart';
import 'package:recipe_app/presentation/component/image_component/app_image.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/recipe_component/recipe_card.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  // List<Recipe> _allRecipes = [];
  const SearchRecipesScreen({super.key, required this.viewModel});

  factory SearchRecipesScreen.withMock() {
    return SearchRecipesScreen(
      viewModel: SearchRecipesViewModel(
        RecipeRepositoryImpl(
          remoteDataSource: null,
          localDataSource: MockRecipeDataSourceImpl(),
        ),
      ),
    );
  }

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.load();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final state = widget.viewModel.state;

        final filtered = state.filtered;
        final query = state.query;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Search recipes',
              style: AppTextStyles.mediumBold(color: ColorStyle.labelColour),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: InputField(
                          labelTitle: '',
                          placeholderText: 'Search recipe',
                          value: query,
                          onValueChange: widget.viewModel.updateQuery,
                          iconWidget: InputField.searchIcon(),
                          height: 40,
                          inputHorizontalPadding: 10,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      height: 52,
                      width: 40,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: 6,
                            child: GestureDetector(
                              onTap: () async {
                                FocusScope.of(context).unfocus();

                                final result = await showModalBottomSheet<
                                  FilterSearchState
                                >(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: ColorStyle.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(50),
                                    ),
                                  ),
                                  builder:
                                      (context) => FilterSearchBottomSheet(
                                        state: state.filterSearchState,
                                      ),
                                );
                                if (result != null) {
                                  widget.viewModel.applyFilter(result);
                                }
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: ColorStyle.primary100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: AppImage(
                                      path:
                                          'assets/images/icons/icon_setting.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (!state.filterSearchState.isinitial)
                            Positioned(
                              top: 0,
                              right: -6,
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  widget.viewModel.applyFilter(
                                    const FilterSearchState(),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                    color: ColorStyle.primary40,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 12,
                                    color: ColorStyle.black,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        (query.isEmpty && state.filterSearchState.isinitial)
                            ? 'Recent Result'
                            : 'Search Recipes',
                        style: AppTextStyles.normalBold(),
                      ),
                      const Spacer(),
                      if (query.isNotEmpty ||
                          !state.filterSearchState.isinitial)
                        Text(
                          '${filtered.length} results',
                          style: AppTextStyles.smallRegular(
                            color: ColorStyle.gray3,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: switch (state.recipes) {
                    UiLoading() => const Center(
                      child: CircularProgressIndicator(),
                    ),

                    UiSuccess() => Builder(
                      builder: (context) {
                        if (filtered.isEmpty) {
                          return Center(
                            child: Text(
                              '표시할 레시피가 없어요 😢',
                              style: AppTextStyles.normalBold(),
                            ),
                          );
                        }
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                childAspectRatio: 1,
                              ),
                          itemCount: filtered.length,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemBuilder: (context, index) {
                            final recipe = filtered[index];
                            return RecipeCard(
                              title: recipe.name,
                              imagePath: recipe.image,
                              cookTime: recipe.time,
                              authorName: recipe.chef,
                              rating: recipe.rating,
                              isFavorite: false,
                              showCookTime: false,
                              showFavorite: false,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                debugPrint('지금은 없어~~');
                              },
                            );
                          },
                        );
                      },
                    ),

                    UiEmpty() => const Center(child: Text('저장된 레시피가 없습니다.')),

                    UiError(message: final msg) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('에러 발생: $msg'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: widget.viewModel.load,
                            child: const Text('다시 시도'),
                          ),
                        ],
                      ),
                    ),
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
