import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/filter/filter_enum.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/search_field.dart';
import 'package:recipe_app/presentation/component/skeleton_effect.dart';
import 'package:recipe_app/presentation/screen/search_recipes/filter_search_bottom_sheet.dart';
import 'package:recipe_app/presentation/screen/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

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
    widget.viewModel.fetchRecipe(); // 초기 상태에서 검색 호출
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 전체 화면 조절 가능 모드
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50.0), // 상단 모서리를 둥글게 처리
        ),
      ),
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FilterSearchBottomSheet(
                viewModel: widget.viewModel,
              ), // 자식 위젯 추가
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorStyle.white,
        backgroundColor: ColorStyle.white,
        automaticallyImplyLeading: false,
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
              value: '',
              onValueChange: (value) {
                widget.viewModel.searchRecipe(value); // 키워드 업데이트
              },
              onFilterPressed: () {
                _showFilterBottomSheet(context);
              },
            ),
            const SizedBox(height: 20),

            // ListenableBuilder 필수!
            ListenableBuilder(
              listenable: widget.viewModel,
              builder: (context, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.viewModel.state.keyword.isEmpty &&
                              widget
                                      .viewModel
                                      .state
                                      .filterSearchState
                                      .category ==
                                  Category.all &&
                              widget.viewModel.state.filterSearchState.rate ==
                                  0 &&
                              widget.viewModel.state.filterSearchState.time ==
                                  Time.all
                          ? 'Recent Search'
                          : 'Search recipe',
                      style: AppTextStyles.normalBold(),
                    ),

                    widget.viewModel.state.keyword.isEmpty &&
                            widget.viewModel.state.filterSearchState.category ==
                                Category.all &&
                            widget.viewModel.state.filterSearchState.rate ==
                                0 &&
                            widget.viewModel.state.filterSearchState.time ==
                                Time.all
                        ? const SizedBox.shrink() // null 대신 사용:
                        : Text(
                          '${widget.viewModel.state.filterRecipes.length} results',
                          style: AppTextStyles.smallRegular(
                            color: ColorStyle.gray3,
                          ),
                        ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListenableBuilder(
                listenable: widget.viewModel,
                builder: (context, child) {
                  final recipes = widget.viewModel.state.filterRecipes;
                  // 로딩 상태
                  if (widget.viewModel.state.isLoading) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2열 레이아웃
                            mainAxisSpacing: 16.0, // 세로 간격
                            crossAxisSpacing: 16.0, // 가로 간격
                            childAspectRatio: 0.8, // 아이템의 가로/세로 비율
                          ),
                      itemCount: 6,
                      itemBuilder:
                          (context, index) => const SkeletonEffect(
                            width: double.infinity,
                            height: 150,
                          ),
                    );
                  }

                  // 검색 결과 없음
                  if (recipes.isEmpty) {
                    return Center(
                      child: Text(
                        '레시피가 없습니다🥹',
                        style: AppTextStyles.mediumRegular(),
                      ),
                    );
                  }

                  // 검색 결과 표시
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                          childAspectRatio: 0.8,
                        ),
                    itemCount: recipes.length,

                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return RecipeCard(recipe: recipe, isGrid: true);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
