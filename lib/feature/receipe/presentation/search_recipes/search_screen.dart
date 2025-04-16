import 'package:flutter/material.dart';
import 'package:recipe_app/core/modules/state/state_handling.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/feature/receipe/data/repository/search/search_recipe_repository_impl.dart';
import 'package:recipe_app/feature/receipe/data/data_source/search/mock/mock_search_recipe_data_source_impl.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/filter_modal/filter_search_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/filter_modal/filter_search_view_model.dart';
import 'package:recipe_app/feature/receipe/presentation/search_recipes/search_view_model.dart';
import 'package:recipe_app/core/presentation/widgets/textfield/app_textfield.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/filter_search_button.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/recipe_card.dart';

final _viewModel = SearchViewModel(
  SearchRecipeRepositoryImpl(MockSearchRecipeDataSourceImpl()),
);

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filterSearchViewModel = FilterSearchViewModel(_viewModel);
    return BaseScreen(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        backgroundColor: AppColor.white,
        title: const Text('Search recipes'),
      ),
      child: ListenableBuilder(
        listenable: _viewModel..fetchSearchData(),
        builder: (context, child) {
          final state = _viewModel.state;
          final isChangeUI = _viewModel.isChangeUI;
          final viewState = state.viewState;
          final recipes = state.data;

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
                          onChanged: (val) {
                            _viewModel.searchData(val);
                          },
                          borderColor: AppColor.grey4,
                          textColor: AppColor.grey4,
                          contentPadding: const EdgeInsets.all(8),
                          controller: _controller,
                          hintText: 'Search recipe',
                        ),
                      ),
                      const SizedBox(width: 20),
                      FilterSearchButton(() {
                        filterSearchViewModel.resetData();
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          builder: (context) {
                            return FilterSearch(filterSearchViewModel);
                          },
                        );
                      }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isChangeUI ? 'Search Result' : 'Recent Search',
                          style: AppTextStyle.normalBold,
                        ),
                        if (isChangeUI)
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
