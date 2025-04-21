import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_ropository.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  
  @override
  Future<List<Recipe>> getRecipes() async {
    
    await Future.delayed(Duration(seconds: 2));
    
    return [
      Recipe(
        imageUrl: 'assets/images/food1.png',
        recipeName: 'Traditional spare ribs baked Spicy Korean Kimchi',
        chefName: 'Chef John',
        rating: 4.6,
        cookingTime: '20 min',
        isBookmarked: true,
      ),
      Recipe(
        imageUrl: 'assets/images/food2.png',
        recipeName: 'Creamy Alfredo Pasta Creamy Alfredo Pasta',
        chefName: 'Chef Emily',
        rating: 4.3,
        cookingTime: '25 min',
        isBookmarked: false,
      ),
      Recipe(
        imageUrl: 'assets/images/food3.png',
        recipeName: 'Traditional Spicy Korean Kimchi Stew',
        chefName: 'Chef Minsoo',
        rating: 4.7,
        cookingTime: '40 min',
        isBookmarked: true,
      ),
      Recipe(
        imageUrl: 'assets/images/food4.png',
        recipeName: 'Grilled Salmon with Lemon Chicken Pizza',
        chefName: 'Chef Angela',
        rating: 4.5,
        cookingTime: '30 min',
        isBookmarked: false,
      ),
      Recipe(
        imageUrl: 'assets/images/food5.png',
        recipeName: 'Grilled Vegetarian Tofu Stir-fry',
        chefName: 'Chef Yu',
        rating: 4.2,
        cookingTime: '15 min',
        isBookmarked: true,
      ),
      Recipe(
        imageUrl: 'assets/images/food6.png',
        recipeName: 'BBQ Chicken Pizza',
        chefName: 'Chef Luca',
        rating: 4.1,
        cookingTime: '20 min',
        isBookmarked: false,
      ),
      Recipe(
        imageUrl: 'assets/images/food7.png',
        recipeName: 'Classic Margherita Pizza',
        chefName: 'Chef Mario',
        rating: 4.0,
        cookingTime: '18 min',
        isBookmarked: true,
      ),
      Recipe(
        imageUrl: 'assets/images/food8.png',
        recipeName: 'Avocado Toast with Egg',
        chefName: 'Chef Sophia',
        rating: 3.9,
        cookingTime: '10 min',
        isBookmarked: false,
      ),
      Recipe(
        imageUrl: 'assets/images/food9.png',
        recipeName: 'Garlic Butter Shrimp',
        chefName: 'Chef David',
        rating: 4.4,
        cookingTime: '12 min',
        isBookmarked: true,
      ),
      Recipe(
        imageUrl: 'assets/images/food10.png',
        recipeName: 'Thai Green Curry',
        chefName: 'Chef Suda',
        rating: 4.6,
        cookingTime: '35 min',
        isBookmarked: false,
      ),
    ];
  }
}
