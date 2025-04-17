import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

import '../component/buttons.dart';
import '../component/filter_button.dart';
import '../component/half_recipe_card.dart';
import '../component/search_field.dart';
import '../ui/color_styles.dart';
import '../ui/text_styles.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel searchRecipesViewModel;

  const SearchRecipesScreen({super.key, required this.searchRecipesViewModel});

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    widget.searchRecipesViewModel.fetchRecipes();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.searchRecipesViewModel,
      builder: (context, child) {
        final state = widget.searchRecipesViewModel.state;
        final isText = state.searchKeyword.isNotEmpty;
        final recipeList = isText ? state.filterRecipes : state.recipes;

        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back, size: 20),
                  const SizedBox(width: 69),
                  Text(
                    'Search recipes',
                    style: TextStyles.mediumTextBold.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchField(
                    controller: _searchController,
                    onChanged: (value) {
                      widget.searchRecipesViewModel.updateKeyword(value);
                    },
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorStyles.primary100,
                    ),
                    child: Image.asset(
                      'assets/icons/outline_setting.png',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 112,
                    height: 24,
                    child: Text(
                      isText ? 'Recent Search' : 'Search Result',
                      style: TextStyles.normalTextBold.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GridView.builder(
                  itemCount: recipeList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return HalfRecipeCard(recipe: recipeList[index]);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
