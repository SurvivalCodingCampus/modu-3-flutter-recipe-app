import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/buttons/box_icon_button.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet.dart';
import 'package:recipe_app/presentation/component/form/search_bar.dart';
import 'package:recipe_app/presentation/component/search_recipe_card.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';
import 'package:recipe_app/ui/ui.dart';

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
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(children: _buildContent(context)),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Search Recipes', style: TextStyles.mediumTextBold),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => onAction(const SearchRecipesAction.onTapBackArrow()),
        ),
      ),
    );
  }

  List<Widget> _buildContent(BuildContext context) {
    if (state.isLoading) {
      return [
        _buildSearchBar(context),
        const SizedBox(height: 100),
        const CircularProgressIndicator(),
      ];
    }

    if (state.query.trim().isEmpty) {
      return [
        _buildSearchBar(context),
        const SizedBox(height: 30),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Recent Search', style: TextStyles.normalTextBold)],
        ),
        const SizedBox(height: 20),
      ];
    }

    return [
      _buildSearchBar(context),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Search Result', style: TextStyles.normalTextBold),
          Text(
            '${state.recipes.length} results',
            style: TextStyles.smallTextRegular.copyWith(
              color: ColorStyles.gray3,
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      _buildGridView(context),
    ];
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchInput(
            hintText: 'Search recipe',
            onTap: () {},
            onSubmitted: (query) {
              onAction(SearchRecipesAction.onSubmitSearch(query.trim()));
            },
          ),
        ),
        const SizedBox(width: 10),
        BoxIconButton(
          icon: Icons.tune,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) {
                return FilterSearchBottomSheet(
                  state: state.bottomSheetFilter,
                  onApply: (filterState) {
                    onAction(SearchRecipesAction.onApplyFilter(filterState));
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildGridView(BuildContext context) {
    return GridView.builder(
      itemCount: state.recipes.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        final recipe = state.recipes[index];
        return SearchRecipeCard(
          author: recipe.chef,
          title: recipe.name,
          imagePath: recipe.imageUrl,
          rating: recipe.rating.toInt(),
        );
      },
    );
  }
}
