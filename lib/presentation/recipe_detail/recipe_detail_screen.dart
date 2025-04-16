import 'package:flutter/material.dart';
import 'package:recipe_app/2025-04-09/presentation/component/tabs.dart';
import 'package:recipe_app/data/model/procedure.dart';
import 'package:recipe_app/data/repository/chef/chef_repository_impl.dart';
import 'package:recipe_app/presentation/component/chef_profile.dart';
import 'package:recipe_app/presentation/component/detail_recipe_card.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_view_model.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';
import 'package:recipe_app/ui/color.dart';

import '../../data/model/recipes.dart';
import '../component/ingredientItem.dart';



class RecipeDetailScreen extends StatefulWidget {
  final RecipeDetailViewModel  viewModel;

  const RecipeDetailScreen({super.key, required this.viewModel,});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int _currentIndex = 0;


  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, index) {
        if (widget.viewModel.state.isLoading) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DetailRecipeCard(
                  viewModel: widget.viewModel,
                ),
                SizedBox(
                  height: 6,
                ),
                ChefProfile(chef: widget.viewModel.state.chef!),
                SizedBox(
                  height: 10,
                ),
                TabsWidget(
                  labels: ['Ingredient', 'Procedure'],
                  selectedindex: _currentIndex,
                  onValueChange: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.set_meal, size: 17, color: Colors.grey),
                          SizedBox(width: 4,),
                          Text('1 serve',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Text('${widget.viewModel.state.recipe.ingredients.length} items',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _currentIndex == 0
                    ? ListView.builder(
                      itemCount: widget.viewModel.state.recipe.ingredients.length,
                      itemBuilder: (context, index) {
                        final ingredient = widget.viewModel.state.recipe.ingredients[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Ingredientitem(ingredients: ingredient),
                        );
                      }
                    )
                    : Expanded(
                      child: ListView.builder(
                        itemCount: widget.viewModel.state.procedure.length,
                        itemBuilder: (context, index) {
                          final step = widget.viewModel.state.procedure[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Step ${step.step}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(step.content,
                                  style: TextStyle(
                                    color: ColorStyles.gray4,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                    )
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}