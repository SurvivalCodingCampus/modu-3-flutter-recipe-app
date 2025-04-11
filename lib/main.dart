import 'package:flutter/material.dart';
import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/mock/mock_recipe_data_source.dart';
import 'package:recipe_app/data/repository/interface/recipe_repository.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/component/components.dart';
import 'package:recipe_app/presentation/recipe/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/recipe/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/ui.dart';

final RecipeDataSource recipeDataSource = MockRecipeDataSource();
final RecipeRepository recipeRepository = RecipeRepositoryImpl(
  recipeDataSource,
);
final SavedRecipesViewModel savedRecipesViewModel = SavedRecipesViewModel(
  recipeRepository,
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorStyles.white,
        appBarTheme: const AppBarTheme(backgroundColor: ColorStyles.white),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/buttons':
            (context) => ComponentsScreen(
              title: 'Buttons',
              children: [
                BigButton(
                  text: "Button",
                  onPressed: () => debugPrint('Big Button pressed'),
                ),
                MediumButton(
                  text: "Button",
                  onPressed: () => debugPrint('Medium Button pressed'),
                ),
                SmallButton(
                  text: "Button",
                  onPressed: () => debugPrint('Small Button pressed'),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        SelectButton(icon: Icons.star, text: '5', onTap: () {}),
                        SelectButton(icon: Icons.star, text: '5', onTap: () {}),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SelectButton(text: 'Text', onTap: () {}),
                        SelectButton(text: 'Text', onTap: () {}),
                      ],
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
        '/forms':
            (context) => ComponentsScreen(
              title: 'Forms',
              children: [
                InputField(
                  label: 'Label',
                  onValueChange: (value) {},
                  placeholder: 'Placeholder',
                ),
              ],
            ),
        '/tabs':
            (context) => ComponentsScreen(
              title: 'Tabs',
              children: [
                MultiTab(
                  labels: const ['Tab 1', 'Tab 2'],
                  onValueChange: (index) {
                    debugPrint('$index');
                  },
                ),
                MultiTab(
                  labels: const ['Tab 1', 'Tab 2', 'Tab 3'],
                  selectedIndex: 2,
                  onValueChange: (index) {
                    debugPrint('$index');
                  },
                ),
              ],
            ),
        '/others':
            (context) => ComponentsScreen(
              title: 'Others',
              children: [
                const Column(
                  children: [
                    Column(
                      spacing: 10,
                      children: [
                        IngredientItem(
                          name: 'Tomato',
                          imagePath: 'assets/images/tomato.png',
                          weight: '100g',
                        ),
                        IngredientItem(
                          name: 'Cabbage',
                          imagePath: 'assets/images/cabbage.png',
                          weight: '300g',
                        ),
                        IngredientItem(
                          name: 'Taco',
                          imagePath: 'assets/images/taco.png',
                          weight: '1t',
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  spacing: 10,
                  children: [
                    RecipeCard(
                      cookTime: 10,
                      title: 'spice roasted chicken  with flavored rice',
                      imagePath: 'assets/images/card-1.png',
                      rating: 4,
                      author: 'Mark Kelvin',
                      onBookmark: () {},
                    ),
                    RecipeCard(
                      cookTime: 10,
                      title: 'Traditional spare ribs baked',
                      imagePath: 'assets/images/card-2.png',
                      rating: 4,
                      author: 'Mark Kelvin',
                      onBookmark: () {},
                    ),
                    RecipeCard(
                      cookTime: 10,
                      title: 'Spicy fried rice mix chicken bali',
                      imagePath: 'assets/images/card-3.png',
                      rating: 3,
                      author: 'Mark Kelvin',
                      onBookmark: () {},
                    ),
                    const Divider(),
                    RatingDialog(
                      title: 'Rate recipe',
                      buttonName: 'Send',
                      onSubmit: (int rating) => debugPrint('$rating'),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            ),
        '/recipe/saved':
            (context) => SavedRecipesScreen(viewModel: savedRecipesViewModel),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MediumButton(
              text: 'Button Components',
              onPressed: () {
                Navigator.of(context).pushNamed('/buttons');
              },
            ),
            MediumButton(
              text: 'Form Components',
              onPressed: () {
                Navigator.of(context).pushNamed('/forms');
              },
            ),
            MediumButton(
              text: 'Tabs Components',
              onPressed: () {
                Navigator.of(context).pushNamed('/tabs');
              },
            ),
            MediumButton(
              text: 'Other Components',
              onPressed: () {
                Navigator.of(context).pushNamed('/others');
              },
            ),
            MediumButton(
              text: 'Saved Recipes',
              onPressed: () {
                Navigator.of(context).pushNamed('/recipe/saved');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ComponentsScreen extends StatelessWidget {
  final List<Widget> children;
  final String title;

  const ComponentsScreen({
    super.key,
    required this.children,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(spacing: 16, children: children),
          ),
        ),
      ),
    );
  }
}
