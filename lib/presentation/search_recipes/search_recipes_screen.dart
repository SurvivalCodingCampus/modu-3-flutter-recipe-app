import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/recipe_card_search.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';
import '../component/input_field_widget.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search recipes', style: TextStyles.mediumBold()),
          centerTitle: true,
        ),
        body: ListenableBuilder(
          listenable: viewModel,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: InputFieldWidget(
                            placeHolder: 'Search recipe',
                            icon: Icon(Icons.search_outlined, color: ColorStyles.gray4, size: 30,),
                            onValueChange: (String value) {
                              viewModel.updateSearchString(value);
                              viewModel.searchRecipes(value);
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ColorStyles.primary100,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(Icons.tune, size: 30, color: ColorStyles.white,),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          viewModel.state.searchString.isNotEmpty
                              ? 'Search Result'
                              : 'Recent Search',
                          style: TextStyles.largeBold(),
                        ),
                        Text(
                          viewModel.state.searchString.isNotEmpty
                              ? '${viewModel.state.searchRecipes.length} result'
                              : '',
                          style: TextStyles.smallRegular(color: ColorStyles.gray3),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children:
                          viewModel.state.searchRecipes
                              .map(
                                (recipe) => RecipeCardSearch(
                                  recipe: recipe,
                                  onClick: () {},
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
