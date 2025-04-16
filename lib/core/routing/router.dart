abstract class Routes {
  // 인증 경로
  static const String splash = '/splash';
  static const String signIn = '/auth-in';
  static const String signUp = '/auth-up';

  //메인 탭 경로
  static const String home = '/home';
  static const String savedRecipes = '/saved-recipes';
  static const String notifications = '/notifications';
  static const String profile = '/profile';

  static const String search = '/search';

  static const String ingredient = '/ingredient/:recipeId';
}