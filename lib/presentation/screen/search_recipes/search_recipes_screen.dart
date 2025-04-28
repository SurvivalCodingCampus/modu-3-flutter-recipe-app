import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/core/component/item_card/recipe_card.dart';
import 'package:recipe_app/core/component/text_field/search_field.dart';
import 'package:recipe_app/core/component/image/skeleton_effect.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/presentation/screen/search_recipes/action/search_recipe_action.dart';
import 'package:recipe_app/presentation/screen/search_recipes/state/search_recipe_state.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipeState state;
  // final void Function(String keyword) searchRecipe;
  // final VoidCallback showFilter;
  final void Function(SearchRecipeAction action) onAction;

  const SearchRecipesScreen({
    super.key,
    required this.state,
    // required this.searchRecipe,
    // required this.showFilter,
    required this.onAction,
  });

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorStyle.white,
        backgroundColor: ColorStyle.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // 뒤로가기 동작
          },
        ),
        title: Text(
          'Search recipe',
          style: AppTextStyles.mediumBold(color: ColorStyle.label),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 검색 필드
            SearchField(
              placeHolder: 'Search recipe',
              value: widget.state.keyword,
              onValueChange: (value) {
                widget.onAction(
                  SearchRecipeAction.searchRecipe(value),
                ); // 키워드 업데이트
              },
              onFilterPressed: () {
                widget.onAction(SearchRecipeAction.showFilter());
              },
            ),
            const SizedBox(height: 20),

            subHeader(),

            const SizedBox(height: 20),

            Expanded(child: buildReasult()),
          ],
        ),
      ),
    );
  }

  Widget subHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.state.keyword.isEmpty &&
                  widget.state.filterSearchState.category == Category.all &&
                  widget.state.filterSearchState.rate == 0 &&
                  widget.state.filterSearchState.time == Time.all
              ? 'Recent Search'
              : 'Search recipe',
          style: AppTextStyles.normalBold(),
        ),

        widget.state.keyword.isEmpty &&
                widget.state.filterSearchState.category == Category.all &&
                widget.state.filterSearchState.rate == 0 &&
                widget.state.filterSearchState.time == Time.all
            ? const SizedBox.shrink() // null 대신 사용:
            : Text(
              '${widget.state.filterRecipes.length} results',
              style: AppTextStyles.smallRegular(color: ColorStyle.gray3),
            ),
      ],
    );
  }

  Widget buildReasult() {
    final recipes = widget.state.filterRecipes;
    // 로딩 상태
    if (widget.state.isLoading) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2열 레이아웃
          mainAxisSpacing: 16.0, // 세로 간격
          crossAxisSpacing: 16.0, // 가로 간격
          childAspectRatio: 0.8, // 아이템의 가로/세로 비율
        ),
        itemCount: 6,
        itemBuilder:
            (context, index) =>
                const SkeletonEffect(width: double.infinity, height: 150),
      );
    }

    // 검색 결과 없음
    if (recipes.isEmpty) {
      return Center(
        child: Text('레시피가 없습니다🥹', style: AppTextStyles.mediumRegular()),
      );
    }

    // 검색 결과 표시
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 0.8,
      ),
      itemCount: recipes.length,

      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return RecipeCard(
          recipe: recipe,
          isNotIconArea: true,
          onBookMarkTap: () {},
        );
      },
    );
  }
}
