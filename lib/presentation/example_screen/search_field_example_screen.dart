import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/search_field.dart';
import 'package:recipe_app/presentation/screen/search_recipes/filter_search_bottom_sheet.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SearchFieldExampleScreen extends StatelessWidget {
  const SearchFieldExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchFiel 미리보기', style: AppTextStyles.largeBold()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchField(
              placeHolder: 'Search recipe',
              value: '',
              onValueChange: (value) {},
              onFilterPressed: () {},
            ),
            // FilterSearchBottomSheet(),
          ],
        ),
      ),
    );
  }
}
