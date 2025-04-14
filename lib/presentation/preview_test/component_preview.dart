import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/custom_button.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_button.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/rating_button.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/rating_dialog_content.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/tabs.dart';

void main() {
  runApp(const WidgetPreviewApp());
}

class WidgetPreviewApp extends StatelessWidget {
  const WidgetPreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Preview',
      home: const PreviewHomePage(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}

class PreviewHomePage extends StatefulWidget {
  const PreviewHomePage({super.key});

  @override
  State<PreviewHomePage> createState() => _PreviewHomePageState();
}

class _PreviewHomePageState extends State<PreviewHomePage> {
  int selectedTimeIndex = 0;
  int selectedRate = 0;
  int selectedCategoryIndex = 0;
  String inputValue = '';
  int selectedTabIndex2 = 0;
  int selectedTabIndex3 = 0;

  void showRatingDialog() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            content: RatingDialogContent(
              title: 'Rate recipe',
              submitTitle: 'Send',
              onSubmitted: (rating) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('선택한 별점: $rating')));
              },
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Preview')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CustomButton (Big/Medium/Small)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BigButton(title: 'Big 버튼', onTap: () {}),
            const SizedBox(height: 8),
            MediumButton(title: 'Medium 버튼', onTap: () {}),
            const SizedBox(height: 8),
            SmallButton(title: 'Small 버튼', onTap: () {}),
            const Divider(),

            const Text(
              'Filter Search',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            const Text('Time'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                FilterButton(
                  title: 'All',
                  isSelected: selectedTimeIndex == 0,
                  onPressed: () => setState(() => selectedTimeIndex = 0),
                ),
                FilterButton(
                  title: 'Newest',
                  isSelected: selectedTimeIndex == 1,
                  onPressed: () => setState(() => selectedTimeIndex = 1),
                ),
                FilterButton(
                  title: 'Oldest',
                  isSelected: selectedTimeIndex == 2,
                  onPressed: () => setState(() => selectedTimeIndex = 2),
                ),
                FilterButton(
                  title: 'Popularity',
                  isSelected: selectedTimeIndex == 3,
                  onPressed: () => setState(() => selectedTimeIndex = 3),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Rate'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                RatingButton(
                  rate: 5,
                  isSelected: selectedRate == 5,
                  onPressed: () => setState(() => selectedRate = 5),
                ),
                RatingButton(
                  rate: 4,
                  isSelected: selectedRate == 4,
                  onPressed: () => setState(() => selectedRate = 4),
                ),
                RatingButton(
                  rate: 3,
                  isSelected: selectedRate == 3,
                  onPressed: () => setState(() => selectedRate = 3),
                ),
                RatingButton(
                  rate: 2,
                  isSelected: selectedRate == 2,
                  onPressed: () => setState(() => selectedRate = 2),
                ),
                RatingButton(
                  rate: 1,
                  isSelected: selectedRate == 1,
                  onPressed: () => setState(() => selectedRate = 1),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Category'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilterButton(
                  title: 'All',
                  isSelected: selectedCategoryIndex == 0,
                  onPressed: () => setState(() => selectedCategoryIndex = 0),
                ),
                FilterButton(
                  title: 'Cereal',
                  isSelected: selectedCategoryIndex == 1,
                  onPressed: () => setState(() => selectedCategoryIndex = 1),
                ),
                FilterButton(
                  title: 'Vegetables',
                  isSelected: selectedCategoryIndex == 2,
                  onPressed: () => setState(() => selectedCategoryIndex = 2),
                ),
                FilterButton(
                  title: 'Dinner ★',
                  isSelected: selectedCategoryIndex == 3,
                  onPressed: () => setState(() => selectedCategoryIndex = 3),
                ),
                FilterButton(
                  title: 'Chinese',
                  isSelected: selectedCategoryIndex == 4,
                  onPressed: () => setState(() => selectedCategoryIndex = 4),
                ),
                FilterButton(
                  title: 'Local Dish',
                  isSelected: selectedCategoryIndex == 5,
                  onPressed: () => setState(() => selectedCategoryIndex = 5),
                ),
                FilterButton(
                  title: 'Fruit',
                  isSelected: selectedCategoryIndex == 6,
                  onPressed: () => setState(() => selectedCategoryIndex = 6),
                ),
                FilterButton(
                  title: 'Breakfast',
                  isSelected: selectedCategoryIndex == 7,
                  onPressed: () => setState(() => selectedCategoryIndex = 7),
                ),
                FilterButton(
                  title: 'Spanish',
                  isSelected: selectedCategoryIndex == 8,
                  onPressed: () => setState(() => selectedCategoryIndex = 8),
                ),
                FilterButton(
                  title: 'Chinese',
                  isSelected: selectedCategoryIndex == 9,
                  onPressed: () => setState(() => selectedCategoryIndex = 9),
                ),
                FilterButton(
                  title: 'Lunch',
                  isSelected: selectedCategoryIndex == 10,
                  onPressed: () => setState(() => selectedCategoryIndex = 10),
                ),
              ],
            ),
            const Divider(),

            const Text(
              'InputField',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            InputField(
              labelTitle: 'Name',
              placeholderText: 'input your name',
              value: inputValue,
              onValueChange: (val) => setState(() => inputValue = val),
            ),
            const Divider(),

            const Text(
              'RatingDialogContent',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: showRatingDialog,
              child: const Text('show me the money'),
            ),
            const Divider(),

            const Text(
              'IngredientItems',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const IngredientItem(
              title: '양배추',
              imagePath: 'assets/images/ingredient/cabbage.png',
              weight: '520g',
            ),
            const SizedBox(height: 8),
            const IngredientItem(
              title: '빵',
              imagePath: 'assets/images/ingredient/slice_bread.png',
              weight: '200g',
            ),
            const SizedBox(height: 8),
            const IngredientItem(
              title: '토마토',
              imagePath: 'assets/images/ingredient/tomato.png',
              weight: '150g',
            ),
            const SizedBox(height: 8),
            const IngredientItem(
              title: '타코',
              imagePath: 'assets/images/ingredient/taco.png',
              weight: '90g',
            ),
            const Divider(),

            const Text(
              'RecipeCard',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RecipeCard(
              title: 'Traditional spare ribs baked',
              imagePath: 'assets/images/foods/food1.png',
              cookTime: '20 min',
              authorName: 'Chef John',
              rating: 3.5,
              isFavorite: true,
              onTap: () {},
            ),
            const SizedBox(height: 12),
            RecipeCard(
              title: 'spice roasted chicken with flavored rice',
              imagePath: 'assets/images/foods/food2.png',
              cookTime: '20 min',
              authorName: 'Mark Kelvin',
              rating: 4.0,
              isFavorite: false,
              onTap: () {},
            ),
            const SizedBox(height: 12),
            RecipeCard(
              title: 'Spicy fried rice mix chicken bali',
              imagePath: 'assets/images/foods/food3.png',
              cookTime: '30 min',
              authorName: 'Spicy Nelly',
              rating: 4.5,
              isFavorite: true,
              onTap: () {},
            ),
            const SizedBox(height: 12),
            RecipeCard(
              title: 'Lamb chops with fruity couscous and mint',
              imagePath: 'assets/images/foods/food4.png',
              cookTime: '35 min',
              authorName: '강지원',
              rating: 5.0,
              isFavorite: false,
              onTap: () {},
            ),
            const Divider(),

            const Text(
              'Tabs (2개)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Tabs(
              tabTitles: const ['전체', '디저트'],
              selectedIndex: selectedTabIndex2,
              onTabSelected: (i) => setState(() => selectedTabIndex2 = i),
            ),
            const SizedBox(height: 24),
            const Text(
              'Tabs (3개)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Tabs(
              tabTitles: const ['전체', '디저트', '한식'],
              selectedIndex: selectedTabIndex3,
              onTabSelected: (i) => setState(() => selectedTabIndex3 = i),
            ),
          ],
        ),
      ),
    );
  }
}
