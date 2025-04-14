import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search.dart';
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
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  late String keyword;

  @override
  void initState() {
    super.initState();
    widget.searchRecipesViewModel.fetchRecipes();
    _searchController.addListener(() {
      final String keyword = _searchController.text;
      _isSearching = true;
      widget.searchRecipesViewModel.searchRecipes(keyword);
      _searchController.value = _searchController.value.copyWith(text: keyword);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _isSearching = false;
    super.dispose();
  }

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
                                      color: ColorStyles2.gray4,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide: BorderSide(
                                      color: ColorStyles2.gray4,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.search, size: 18),
                                  prefixIconColor: ColorStyles2.gray4,
                                  hintText: 'Search recipe',
                                  hintStyle: TextStyles2.smallerTextRegular,
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
                                    return FilterSearch();
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorStyles2.primary100,
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
                              style: TextStyles2.normalText.copyWith(
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
                              style: TextStyles2.smallerTextRegular.copyWith(
                                color: ColorStyles2.gray3,
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
