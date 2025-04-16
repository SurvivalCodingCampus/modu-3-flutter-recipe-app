import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/component/half_recipe_card.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';

import '../component/buttons.dart';
import '../component/filter_button.dart';
import '../ui/text_styles.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel searchRecipesViewModel;

  const SearchRecipesScreen({super.key, required this.searchRecipesViewModel});

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.searchRecipesViewModel.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.searchRecipesViewModel,
      builder: (context, child) {
        final state = widget.searchRecipesViewModel.state;
        final isText = _searchController.text.isNotEmpty;
        if (widget.searchRecipesViewModel.state.isLoading)
          return CircularProgressIndicator();
         return Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back, size: 20),
                  SizedBox(width: 69),
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
                  SizedBox(
                    width: 255,
                    height: 40,
                    child: TextFormField(
                      controller: _searchController,
                      style: TextStyles.smallerTextRegular,
                      onChanged: (value) {
                        if (isText) {}
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 11, 10, 11),
                          child: Image.asset(
                            'assets/icons/search.png',
                            width: 18,
                            height: 18,
                            color: ColorStyles.gray4,
                          ),
                        ),
                        hintText: 'Search recipe',
                        hintStyle: TextStyles.smallerTextRegular.copyWith(
                          color: ColorStyles.gray4,
                        ),
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: ColorStyles.gray4,
                            width: 1.3,
                          ),
                        ),
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(30, 31, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 450,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Filter Search',
                                    style: TextStyles.smallTextBold.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    width: 256,
                                    height: 58,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Time',
                                          style: TextStyles.smallerTextBold,
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            RatingButton(
                                              buttons: Button(text: 'All'),
                                            ),
                                            SizedBox(width: 10),
                                            RatingButton(
                                              buttons: Button(text: 'Newest'),
                                            ),
                                            SizedBox(width: 10),
                                            Flexible(
                                              child: RatingButton(
                                                buttons: Button(text: 'Oldest'),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            RatingButton(
                                              buttons: Button(
                                                text: 'Popularity',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 20),
                                  Text(
                                    'Rate',
                                    style: TextStyles.smallerTextBold,
                                  ),
                                  SizedBox(height: 10),
                                  FilterButton(buttons: Button(text: '1')),
                                  SizedBox(height: 20),
                                  Text(
                                    'Category',
                                    style: TextStyles.smallerTextBold,
                                  ),
                                  SizedBox(height: 10),
                                  FilterButton(buttons: Button(text: '1')),
                                  SizedBox(height: 10),
                                  FilterButton(buttons: Button(text: '1')),
                                  SizedBox(height: 10),
                                  FilterButton(buttons: Button(text: '1')),
                                  SizedBox(height: 30),
                                  SmallButtonsWidget(
                                    onClick: () {},
                                    buttons: Buttons(name: 'Filter'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorStyles.primary100,
                      ),
                      child: Image.asset(
                        'assets/icons/outline_setting.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GridView.builder(
                  itemCount: state.recipes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return HalfRecipeCard(recipe: state.filterRecipes[index]);
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
