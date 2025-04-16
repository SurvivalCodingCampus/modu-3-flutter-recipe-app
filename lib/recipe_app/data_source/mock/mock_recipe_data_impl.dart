import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';

class MockRecipeDataImpl implements RecipeDataSource {
  @override
  Future<List<Recipe>> getRecipeData() async {
    return [
      Recipe(
        id: 1,
        imagePath: 'assets/images/bibimbop.png',
        title: 'Traditional Korean Rice Food',
        chef: 'Chef John',
        minutes: 20,
        rate: 4.0,
        bookMarked: false,
      ),
      Recipe(
        id: 2,
        imagePath: 'assets/images/jjigae.png',
        title: 'Traditional Korean Stew Food',
        chef: 'Chef Kim',
        minutes: 15,
        rate: 4.5,
        bookMarked: false,
      ),
      Recipe(
        id: 3,
        imagePath: 'assets/images/sushi.png',
        title: 'Traditional Japan Food Food',
        chef: 'Master Nagano',
        minutes: 10,
        rate: 5.0,
        bookMarked: false,
      ),
      Recipe(
        id: 4,
        imagePath: 'assets/images/chicken.png',
        title: 'Korean Style Chicken Food',
        chef: 'Cooking Mama',
        minutes: 40,
        rate: 3.0,
        bookMarked: false,
      ),
      Recipe(
        id: 5,
        imagePath: 'assets/images/paella.png',
        title: 'Traditional Korean Rice Food',
        chef: 'Chef John',
        minutes: 20,
        rate: 4.0,
        bookMarked: false,
      ),
      Recipe(
        id: 1,
        imagePath: 'assets/images/bibimbop.png',
        title: 'Traditional Korean Rice Food',
        chef: 'Chef John',
        minutes: 20,
        rate: 4.0,
        bookMarked: false,
      ),
      Recipe(
        id: 2,
        imagePath: 'assets/images/jjigae.png',
        title: 'Traditional Korean Stew Food',
        chef: 'Chef Kim',
        minutes: 15,
        rate: 4.5,
        bookMarked: false,
      ),
      Recipe(
        id: 3,
        imagePath: 'assets/images/sushi.png',
        title: 'Traditional Japan Food Food',
        chef: 'Master Nagano',
        minutes: 10,
        rate: 5.0,
        bookMarked: false,
      ),
      Recipe(
        id: 4,
        imagePath: 'assets/images/chicken.png',
        title: 'Korean Style Chicken Food',
        chef: 'Cooking Mama',
        minutes: 40,
        rate: 3.0,
        bookMarked: false,
      ),
      Recipe(
        id: 5,
        imagePath: 'assets/images/paella.png',
        title: 'Traditional Korean Rice Food',
        chef: 'Chef John',
        minutes: 20,
        rate: 4.0,
        bookMarked: false,
      ),
    ];
  }
}
