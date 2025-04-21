import 'package:flutter/material.dart';
import 'package:recipe_app/core/modules/state/state_handling.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/filter_modal/filter_search_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/filter_modal/filter_search_view_model.dart';
import 'package:recipe_app/feature/receipe/presentation/search_recipes/search_view_model.dart';
import 'package:recipe_app/core/presentation/widgets/textfield/app_textfield.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/filter_search_button.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/recipe_card.dart';

class SearchScreen extends StatefulWidget {
  final SearchViewModel viewModel;
  const SearchScreen(this.viewModel, {super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    widget.viewModel.fetchSearchData();
    widget.viewModel.getRecentSearchText();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filterSearchViewModel = FilterSearchViewModel(widget.viewModel);
    return BaseScreen(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: const Text('Search recipes'),
      ),
      child: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          final state = widget.viewModel.state;
          final isChangeUI = widget.viewModel.isChangeUI;
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
                            widget.viewModel.searchData(val);
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
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          widget.viewModel.state.recentSearchText
                              .map(
                                (e) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    e,
                                    style: AppTextStyle.smallRegular,
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
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
                          bookmarkTap: () {},
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
