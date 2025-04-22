abstract class Routes {
  static const splash = '/splash';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const ingredient = '/ingredient/:${RoutesParameters.ingredientRecipeIdParameter}';
  static const search = '/search';

  static const home = '/home';
  static const favorites = '/favorites';
  static const notifications = '/notifications';
  static const profile = '/profile';
}

abstract class RoutesParameters {
  static const ingredientRecipeIdParameter = 'recipeId';
}