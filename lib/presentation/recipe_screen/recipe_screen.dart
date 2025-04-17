import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/tabs.dart';
import 'package:recipe_app/presentation/recipe_screen/recipe_screen_view_model.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/ingredient_list.dart';
import '../component/procedure_list.dart';
import '../component/recipe_card.dart';
import '../component/small_button.dart';

class RecipeScreen extends StatelessWidget {
  final RecipeScreenViewModel viewModel;

  const RecipeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/more.png'),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          final state = viewModel.state;

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.recipe == null) {
            return const Center(child: Text('Recipe not found'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecipeCard(
                  recipe: state.recipe!,
                  showBookMarked: true,
                  showTitle: false,
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      state.recipe!.name,
                      style: TextStyles.smallBold.copyWith(fontSize: 14),
                    ),
                    Text(
                      '(13k Reviews)',
                      style: TextStyles.normalRegular.copyWith(
                        fontSize: 14,
                        color: ColorStyles.gray3,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Container(
                      width: 150,
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/chefimage.png',
                            width: 40,
                            height: 40,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Text(
                              state.recipe!.chef,
                              style: TextStyles.smallBold.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  size: 14,
                                  color: ColorStyles.gray3,
                                ),
                                Text(
                                  state.recipe!.time,
                                  style: TextStyles.smallBold.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const SmallButton(text: 'Follow'),
                  ],
                ),

                const SizedBox(height: 12),

                Tabs(
                  labels: ['Ingredient', 'Procedure'],
                  selectedIndex: state.isIngredientSelected ? 0 : 1,
                  onChanged: (index) {
                    if (index == 0) {
                      viewModel.selectIngredientTab();
                    } else {
                      viewModel.selectProcedureTab();
                    }
                  },
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Image.asset('assets/images/Icon.jpeg'),
                    const SizedBox(width: 8),
                    Text(
                      '1 serve',
                      style: TextStyles.smallRegular.copyWith(
                        fontSize: 11,
                        color: ColorStyles.gray3,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${state.ingredients.length} items',
                      style: TextStyles.smallRegular.copyWith(
                        fontSize: 11,
                        color: ColorStyles.gray3,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                if (state.isIngredientSelected)
                  IngredientList(ingredients: state.ingredients),
                if (!state.isIngredientSelected)
                  ProcedureList(procedures: state.procedures),
              ],
            ),
          );
        },
      ),
    );
  }
}
