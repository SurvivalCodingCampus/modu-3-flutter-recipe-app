import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/recipe_tile.dart';
import 'package:recipe_app/core/presentation/components/search_zone.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SearchRecipesSreen extends StatelessWidget {
  final void Function(String value) onChange;
  final SearchRecipesState state;
  final TextEditingController controller;
  final VoidCallback onSettingsClick;

  const SearchRecipesSreen({
    super.key,
    required this.onChange,
    required this.state,
    required this.controller,
    required this.onSettingsClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search recipes', style: AppTextStyles.mediumBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            SearchZone(
              onChange: onChange,
              controller: controller,
              onSettingsClick: onSettingsClick,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    controller.value.text.isEmpty
                        ? 'Recent Search'
                        : 'Search Results',
                    style: AppTextStyles.normalBold,
                  ),
                ),
                if (controller.value.text.isNotEmpty)
                  Text('${state.count} results'),
              ],
            ),
            Expanded(
              child:
                  state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : state.recipes.isEmpty
                      ? Center(
                        child: Text(
                          '레시피가 없습니다.',
                          style: AppTextStyles.largeBold,
                        ),
                      )
                      : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                            ),
                        itemCount: state.recipes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RecipeTile(recipe: state.recipes[index]);
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
