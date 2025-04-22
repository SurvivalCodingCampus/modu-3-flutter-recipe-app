import 'package:flutter/material.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/screen/filtter/filtter_screen_botton_sheet.dart';
import 'package:recipe_app/presentation/screen/search/search_recipe_card.dart';
import 'package:recipe_app/presentation/screen/search/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/widget/text_field_widget.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';
import 'package:recipe_app/app/ui/color_style.dart';

class SearchRecipesScreen extends StatefulWidget {
  final RecipeRepository repository;

  const SearchRecipesScreen({super.key, required this.repository});

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  late final SearchRecipesViewModel viewModel;
  Map<String, dynamic> currentFilters = {};

  @override
  void initState() {
    super.initState();
    viewModel = SearchRecipesViewModel(widget.repository);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet() {
    FilterSearchBottomSheet.show(
      context,
      onApplyFilter: (selectedFilters) {
        setState(() {
          currentFilters = selectedFilters;
        });
        print("적용된 필터: $selectedFilters"); // 디버깅용
        viewModel.applyFilters(selectedFilters);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search recipe',
          style: AppTextStyles.mediumBold(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          final state = viewModel.state;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // 검색 입력 + 필터 버튼
                Row(
                  children: [
                    Expanded(
                      child: // after
                          TextFieldWidget(
                        hintText: 'Search recipe',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: ColorStyle.gray4,
                        ),
                        onChanged: viewModel.updateQuery,
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: _showFilterBottomSheet,
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                currentFilters.isNotEmpty
                                    ? ColorStyle.mainGreen
                                    : const Color(0xFF129575),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Search Recipe',
                    style: AppTextStyles.mediumBold(color: Colors.black),
                  ),
                ),

                // 현재 적용된 필터 표시 (옵션)
                if (currentFilters.isNotEmpty)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (currentFilters.containsKey('time'))
                          _buildFilterChip(
                            label: 'Time: ${currentFilters['time']}',
                            onRemove: () {
                              setState(() {
                                currentFilters.remove('time');
                                viewModel.applyFilters(currentFilters);
                              });
                            },
                          ),
                        if (currentFilters.containsKey('rating'))
                          _buildFilterChip(
                            label: 'Rating: ${currentFilters['rating']}★',
                            onRemove: () {
                              setState(() {
                                currentFilters.remove('rating');
                                viewModel.applyFilters(currentFilters);
                              });
                            },
                          ),
                        if (currentFilters.containsKey('categories'))
                          ...(currentFilters['categories'] as List<String>)
                              .map(
                                (category) => _buildFilterChip(
                                  label: category,
                                  onRemove: () {
                                    setState(() {
                                      (currentFilters['categories']
                                              as List<String>)
                                          .remove(category);
                                      if ((currentFilters['categories']
                                              as List<String>)
                                          .isEmpty) {
                                        currentFilters.remove('categories');
                                      }
                                      viewModel.applyFilters(currentFilters);
                                    });
                                  },
                                ),
                              )
                              .toList(),
                      ],
                    ),
                  ),
                const SizedBox(height: 16),

                // 검색 결과 상태 표시
                if (!state.isLoading && state.searchQuery.isNotEmpty)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${state.filteredRecipes.length}개의 "${state.searchQuery}" 검색결과',
                      style: AppTextStyles.mediumBold(color: ColorStyle.gray4),
                    ),
                  ),

                const SizedBox(height: 16),

                // 로딩 / 결과 / 레시피 카드
                if (state.isLoading)
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (state.filteredRecipes.isEmpty)
                  const Expanded(
                    child: Center(
                      child: Text(
                        "레시피가 없습니다.",
                        style: TextStyle(fontSize: 16, color: ColorStyle.gray4),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.filteredRecipes.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2열 그리드
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1, // 카드 비율 조정
                          ),
                      itemBuilder: (context, index) {
                        final recipe = state.filteredRecipes[index];
                        return SearchRecipeCard(
                          recipeName: recipe.name,
                          chefName: recipe.chef,
                          recipeImgUrl: recipe.image,
                          recipeRating: recipe.rating ?? 4.0,
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required VoidCallback onRemove,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 4),
          InkWell(onTap: onRemove, child: const Icon(Icons.close, size: 14)),
        ],
      ),
    );
  }
}
