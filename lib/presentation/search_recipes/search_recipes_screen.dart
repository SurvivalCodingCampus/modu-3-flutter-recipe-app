import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/button/enum/category.dart';
import 'package:recipe_app/presentation/component/button/enum/star.dart';
import 'package:recipe_app/presentation/component/button/enum/time.dart';
import 'package:recipe_app/presentation/component/button/filter_button.dart';
import 'package:recipe_app/presentation/component/button/small_button.dart';
import 'package:recipe_app/presentation/component/recipe_grid_card.dart';
import 'package:recipe_app/presentation/component/search_input_field.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel _viewModel;
  const SearchRecipesScreen({
    super.key,
    required SearchRecipesViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search recipes', style: TextFontStyle.mediumBold()),
        backgroundColor: Colors.white10,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(
              spacing: 20,
              children: [
                SearchInputField(
                  placeholder: 'Search recipes',
                  onValueChange: (value) {
                    widget._viewModel.searchRecipes(value);
                  },
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyle.primary100,
                  ),
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        constraints: const BoxConstraints(maxHeight: 600),
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return FilterBottomSheet(
                            viewModel: widget._viewModel,
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.tune_rounded),
                    color: ColorStyle.white,
                  ),
                ),
              ],
            ),
            ListenableBuilder(
              listenable: widget._viewModel,
              builder: (context, snapshot) {
                return widget._viewModel.state.text.isEmpty
                    ? Text('Recent Search', style: TextFontStyle.normalBold())
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search Result',
                          style: TextFontStyle.normalBold(),
                        ),
                        Text(
                          '${widget._viewModel.state.recipes.length} results',
                          style: TextFontStyle.smallRegular(
                            color: ColorStyle.gray4,
                          ),
                        ),
                      ],
                    );
              },
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: widget._viewModel,
                builder: (context, child) {
                  return GridView.builder(
                    itemCount: widget._viewModel.state.recipes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                    itemBuilder: (context, index) {
                      final recipe = widget._viewModel.state.recipes[index];
                      return RecipeGridCard(recipe: recipe);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    super.key,
    required SearchRecipesViewModel viewModel,
  }) : _viewModel = viewModel;

  final SearchRecipesViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 20,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 31),
            child: Text('Filter Search', style: TextFontStyle.smallBold()),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text('Time', style: TextFontStyle.smallBold()),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children:
                      Time.values.map((time) {
                        return FilterButton(
                          text: time.name,
                          isSelected: Time.all == time,
                          onChanged: () {},
                          starIcon: false,
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text('Rate', style: TextFontStyle.smallBold()),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children:
                      Star.values.map((star) {
                        return FilterButton(
                          text: fromStar(star).toString(),
                          isSelected: Star.one == star,
                          onChanged: () {},
                          starIcon: true,
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text('Category', style: TextFontStyle.smallBold()),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children:
                      Category.values.map((category) {
                        return FilterButton(
                          text: category.name,
                          isSelected: Category.all == category,
                          onChanged: () {},
                          starIcon: category.name == 'dinner' ? true : false,
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SmallButton(text: 'Filter', onTap: () {}),
          ),
        ],
      ),
    );
  }
}
