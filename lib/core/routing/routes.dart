abstract class Routes {
  //인증 관련 경로
  static const String splash = '/splash';
  static const String signIn = '/splash/sign-in';
  static const String signUp = '/splash/sign-up';

  //메인 탭 경로
  static const String home = '/home';
  static const String bookmark = '/bookmark';
  static const String notifications = '/notifications';
  static const String profile = '/profile';
  static const String add = '/add';

  //화면 경로
  static const String savedRecipes = '/saved-recipes';
  static const String searchRecipes = '/search-recipes';

  //파라미터가 필요한 경로 맵핑을 위한 방법
  static const String ingredient = '/ingredient/:recipeId';



  //라우트 정의용 상대 경로
  static const String signIn_ = 'sign-in';
  static const String signUp_ = 'sign-up';

}



