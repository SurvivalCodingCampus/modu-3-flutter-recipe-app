import 'package:flutter/material.dart';
import 'package:recipe_app/core/modules/state/state_handling.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/feature/receipe/data/repository/search/search_recipe_repository_impl.dart';
import 'package:recipe_app/feature/receipe/domain/data_source/search/mock/mock_search_recipe_data_source_impl.dart';
import 'package:recipe_app/presentation/pages/base/base_screen.dart';
import 'package:recipe_app/presentation/pages/recipe/search/view_model/search_view_model2.dart';
import 'package:recipe_app/presentation/widgets/base/textfield/app_textfield.dart';
import 'package:recipe_app/presentation/widgets/recipe/filter_search_button.dart';
import 'package:recipe_app/presentation/widgets/recipe/recipe_card.dart';

class SearchScreen2 extends StatelessWidget {
  const SearchScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SearchViewModel2(
      SearchRecipeRepositoryImpl(MockSearchRecipeDataSourceImpl()),
    );
    return BaseScreen(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        backgroundColor: AppColor.white,
        title: const Text('Search recipes'),
      ),
      child: ListenableBuilder(
        listenable: viewModel..fetchSearchData(),
        builder: (context, child) {
          final state = viewModel.state;
          final controller = viewModel.searchController;
          final viewState = state.viewState;
          final recipes = state.data;
          final isFiltered = state.isFiltered;

          return StateHandling(
            viewState,
            complete: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppColor.grey4,
                          ),
                          onChanged: (val) {},
                          borderColor: AppColor.grey4,
                          textColor: AppColor.grey4,
                          contentPadding: const EdgeInsets.all(8),
                          controller: controller,
                          hintText: 'Search recipe',
                        ),
                      ),
                      const SizedBox(width: 20),
                      const FilterSearchButton(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isFiltered ? 'Search Result' : 'Recent Search',
                          style: AppTextStyle.normalBold,
                        ),
                        if (isFiltered)
                          Text(
                            '${recipes.length} results',
                            style: AppTextStyle.smallerRegular.copyWith(
                              color: AppColor.grey3,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                          ),
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return RecipeCard(
                          recipeId: recipe.id,
                          imgUrl: recipe.image,
                          title: recipe.name,
                          owner: recipe.chef,
                          starCount: recipe.rating,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
