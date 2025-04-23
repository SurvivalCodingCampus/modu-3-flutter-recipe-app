import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search/search_action.dart';
import 'package:recipe_app/presentation/search/search_state.dart';

import '../../ui/ui.dart';
import '../component/filter_icon_button.dart';
import '../component/grid_recipe_card.dart';
import '../component/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  final SearchState state;
  final void Function(SearchAction action) onAction;

  const SearchScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 17),
          Row(
            children: [
              Expanded(
                child: SearchTextField(
                  placeholder: 'Search recipe',
                  onValueChanged: (value) {
                    if (value.isNotEmpty) {
                      onAction(SearchAction.searchRecipes(value));
                    }
                  },
                ),
              ),
              const SizedBox(width: 20),
              FilterIconButton(
                onTap: () => onAction(SearchAction.onTapFilter(state.filter)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(state.title, style: TextStyles.normalTextBold),
              const Spacer(),
              Text(
                state.resultsCount,
                style: TextStyles.smallerTextRegular.copyWith(
                  color: ColorStyles.gray3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemBuilder: (context, index) {
                return GridRecipeCard(recipe: state.recipes[index]);
              },
              itemCount: state.recipes.length,
            ),
          ),
        ],
      ),
    );
  }
}
