import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/presentation/common/component/recipe_search_card.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';
import 'package:recipe_app/presentation/page/search_recipes/filter_search/filter_search_screen.dart';
import 'package:recipe_app/presentation/page/search_recipes/filter_search/filter_search_view_model.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_view_model.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({
    super.key,
    required this.viewModel,
  });
  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  Timer? _debounce;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    // widget.viewModel.getRecipes(beforeSearchList: widget.searchResult);
  }

  void _onTextChanged() async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () async {
      widget.viewModel.searchRecipes(keyWord: _controller.text);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              context.pop(widget.viewModel.state.filterRecipes);
                            },
                            icon: Icon(Icons.arrow_back_outlined),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Search recipes',
                            style: AppTextStyles.mediumBold(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          autofocus: false,
                          controller: _controller,
                          decoration: InputDecoration(
                            constraints: BoxConstraints(maxHeight: 40),
                            hintText: 'Search recipe',
                            hintStyle: AppTextStyles.smallRegular(
                              color: ColorStyle.gray4,
                            ),
                            prefixIcon: Container(
                              constraints: BoxConstraints(
                                maxHeight: 18,
                                maxWidth: 18,
                              ),
                              width: 18,
                              height: 18,
                              padding: const EdgeInsets.only(
                                right: 10,
                                left: 10,
                              ),
                              child: Image.asset(
                                'assets/icons/search-normal.png',

                                fit: BoxFit.contain,
                                color: ColorStyle.gray4,
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: ColorStyle.gray4,
                                width: 1.3,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: ColorStyle.gray4,
                                width: 1.3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 484,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                ),
                                child: FilterSearchScreen(
                                  viewModel: FilterSearchViewModel(),
                                )
                              );
                            },
                          ).then((value) {
                            widget.viewModel.filterSearchRecipes(filterMap: value);
                          });
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorStyle.primary100,
                          ),

                          height: 40,
                          width: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset('assets/icons/setting.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.viewModel.state.searchKeyWord.isEmpty
                        ? 'Recent '
                            'Search'
                        : 'Search Result',
                    style: AppTextStyles.normalBold(),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      children:
                          widget.viewModel.state.filterRecipes.isEmpty
                              ? widget.viewModel.state.recipes.map((items) {
                                return RecipeSearchCard(
                                  recipeName: items.name,
                                  recipeAuthor: items.author,
                                  imagePath: items.image,
                                  recipeRate: items.rating,
                                  imageType: ImageType.network,
                                );
                              }).toList()
                              : widget.viewModel.state.filterRecipes.map((
                                items,
                              ) {
                                return RecipeSearchCard(
                                  recipeName: items.name,
                                  recipeAuthor: items.author,
                                  imagePath: items.image,
                                  recipeRate: items.rating,
                                  imageType: ImageType.network,
                                );
                              }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
