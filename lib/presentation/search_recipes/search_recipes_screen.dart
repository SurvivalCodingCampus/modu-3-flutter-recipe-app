import 'package:flutter/material.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';
import 'package:recipe_app/presentation/component/image_component/app_image.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/recipe_component/recipe_card.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesState state;
  final void Function(SearchRecipesAction action) onAction;

  const SearchRecipesScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
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
                      onValueChange:
                          (value) => onAction(
                            SearchRecipesAction.onQueryChange(value),
                          ),
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
                          onTap:
                              () => onAction(
                                const SearchRecipesAction.onOpenFilterSheet(),
                              ),
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
                                  path: 'assets/images/icons/icon_setting.png',
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
                            onTap:
                                () => onAction(
                                  const SearchRecipesAction.onClearFilter(),
                                ),
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
                  if (query.isNotEmpty || !state.filterSearchState.isinitial)
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
                UiLoading() => const Center(child: CircularProgressIndicator()),

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
                          onTap:
                              () => onAction(
                                SearchRecipesAction.onTapRecipe(recipe),
                              ),
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
                        onPressed:
                            () => onAction(const SearchRecipesAction.onRetry()),
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
  }
}
