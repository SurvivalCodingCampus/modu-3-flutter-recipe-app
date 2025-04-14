// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/presentation/component/filter_icon_button.dart';
import 'package:recipe_app/presentation/component/grid_recipe_card.dart';
import 'package:recipe_app/presentation/component/search_text_field.dart';
import 'package:recipe_app/ui/ui.dart';

class SearchScreen extends StatefulWidget {
  final List<Recipe> recipes;
  const SearchScreen({super.key, required this.recipes});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.white,
        surfaceTintColor: ColorStyles.white,
        title: const Text('Search recipes', style: TextStyles.mediumTextBold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 17),
            Row(
              children: [
                Flexible(
                  child: SearchTextField(
                    placeholder: 'Search recipe',
                    onValueChanged:
                        (value) => setState(() {
                          searchText = value;
                          print(searchText);
                        }),
                  ),
                ),
                const SizedBox(width: 20),
                const FilterIconButton(),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Recent Search', style: TextStyles.normalTextBold),
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
                  return GridRecipeCard(recipe: widget.recipes[index]);
                },
                itemCount: widget.recipes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
