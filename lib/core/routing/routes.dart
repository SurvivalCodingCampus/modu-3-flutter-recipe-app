abstract class Routes {
  // 인증경로
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-out';

  // 메인 탭 경로
  static const String home = '/home';
  static const String savedRecipe = '/saved-recipe';
  static const String notification = '/notification';
  static const String profile = '/profile';

  static const String search = '/search';

  // 미리보기화면
  static const String example = '/example';

  // 레시피상세화면
  static const String recipeDetail = '/recipe-detail/:recipeId';
}
