import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data_source/mock/mock_saved_recipe_data_impl.dart';
import 'package:recipe_app/recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_bottom_sheet.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/recipe_app/ui/color_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel searchRecipesViewModel;
  final FilterSearchViewModel filterSearchViewModel;
  final SavedRecipesViewModel savedRecipesViewModel;

  const SearchRecipesScreen({
    super.key,
    required this.searchRecipesViewModel,
    required this.filterSearchViewModel,
    required this.savedRecipesViewModel,
  });

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  late String keyword;
  final mockDataSource = MockSavedRecipeDataImpl();

  @override
  void initState() {
    super.initState();
    widget.searchRecipesViewModel.fetchRecipes();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onToggleBookMark(int index) {
    setState(() {
      widget.savedRecipesViewModel.toggleBookMark(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search recipes',
          textAlign: TextAlign.start,
          style: TextStyles.normalText.copyWith(
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
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                onChanged: (keyword) {
                                  setState(() {
                                    _isSearching = true;
                                    widget.searchRecipesViewModel.searchRecipes(
                                      keyword,
                                    );
                                  });
                                },
                                controller: _searchController,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide: BorderSide(
                                      color: ColorStyles.gray4,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide: BorderSide(
                                      color: ColorStyles.gray4,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.search, size: 18),
                                  prefixIconColor: ColorStyles.gray4,
                                  hintText: 'Search recipe',
                                  hintStyle: TextStyles.smallerTextRegular,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FilterSearchBottomSheet(
                                      filterSearchViewModel:
                                          widget.filterSearchViewModel,
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorStyles.primary100,
                                padding: EdgeInsets.all(5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Image.asset(
                                'assets/icons/filter.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _isSearching == false
                                  ? 'Recent Search'
                                  : 'Search Result',
                              style: TextStyles.normalText.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              _isSearching == false
                                  ? ''
                                  : '${widget.searchRecipesViewModel.searchRecipesState.recipes.length} results',
                              style: TextStyles.smallerTextRegular.copyWith(
                                color: ColorStyles.gray3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      ListenableBuilder(
                        listenable: widget.searchRecipesViewModel,
                        builder: (context, child) {
                          final state =
                              widget.searchRecipesViewModel.searchRecipesState;
                          if (state.isRecipesLoading == true) {
                            return CircularProgressIndicator();
                          }
                          if (state.recipes.isEmpty) {
                            return Center(child: Text('레시피가 없습니다'));
                          }
                          final size = MediaQuery.of(context).size;
                          final aspectRatio =
                              size.width > size.height ? 3 / 1 : 3 / 2;
                          return GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: aspectRatio,
                            children:
                                state.recipes
                                    .map(
                                      (recipe) => RecipeCard(
                                        recipe: recipe,
                                        showTimerAndBookmark: false,
                                        onToggleBookMark: () {
                                          _onToggleBookMark(recipe.id);
                                        },
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
