import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/recipe_app/ui/color_styles2.dart';
import 'package:recipe_app/recipe_app/ui/text_styles2.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel searchRecipesViewModel;

  const SearchRecipesScreen({super.key, required this.searchRecipesViewModel});

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search recipes',
          textAlign: TextAlign.start,
          style: TextStyles2.normalText.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: ColorStyles2.gray4),
                          ),
                          prefixIcon: Icon(Icons.search, size: 18),
                          prefixIconColor: ColorStyles2.gray4,
                          hintText: 'Search recipe',
                          hintStyle: TextStyles2.smallerTextRegular,
                        ),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Recent Search',
                          style: TextStyles2.normalText.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      ListenableBuilder(
                        listenable:
                            widget.searchRecipesViewModel..fetchRecipes(),
                        builder: (context, child) {
                          final state =
                              widget.searchRecipesViewModel.searchRecipesState;
                          if (state.isRecipesLoading == true) {
                            return CircularProgressIndicator();
                          }
                          if (state.recipes.isEmpty) {
                            return Center(child: Text('레시피가 없습니다'));
                          }
                          return GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3 / 2,
                            children:
                                state.recipes
                                    .map(
                                      (recipe) => RecipeCard(
                                        recipe: recipe,
                                        showTimerAndBookmark: false,
                                      ),
                                    )
                                    .toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
