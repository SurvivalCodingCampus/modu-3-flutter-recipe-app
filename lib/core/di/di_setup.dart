import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/auth_data_source.dart';
import 'package:recipe_app/data/data_source/auth_data_source_impl.dart';
import 'package:recipe_app/data/data_source/book_mark_data_source.dart';
import 'package:recipe_app/data/data_source/book_mark_data_source_impl.dart';
import 'package:recipe_app/data/data_source/procedure_data_source.dart';
import 'package:recipe_app/data/data_source/procedure_data_source_impl.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/data_source/user_data_source_impl.dart';
import 'package:recipe_app/data/repository/auth_repository_impl.dart';
import 'package:recipe_app/data/repository/book_mark_repository_impl.dart';
import 'package:recipe_app/data/repository/procedure_repository_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/data/repository/user_repository_impl.dart';
import 'package:recipe_app/domain/repository/auth_repository.dart';
import 'package:recipe_app/domain/repository/book_mark_repository.dart';
import 'package:recipe_app/domain/repository/procedure_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';
import 'package:recipe_app/domain/use_case/fetch_recipe_use_case.dart';
import 'package:recipe_app/domain/use_case/get_book_marked_recipes_id_use_case.dart';
import 'package:recipe_app/domain/use_case/get_login_user_info_use_case.dart';
import 'package:recipe_app/domain/use_case/get_recipe_procedure_use_case.dart';
import 'package:recipe_app/domain/use_case/get_recipes_by_ids_use_case.dart';
import 'package:recipe_app/domain/use_case/get_user_info_use_case.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/recipe_detail_view_model.dart';
import 'package:recipe_app/presentation/screen/search_recipes/search_recipes_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  //데이터 소스 및 레파지토리 등록
  getIt.registerSingleton<UserDataSource>(UserDataSourceImpl());
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(dataSource: getIt<UserDataSource>()),
  );

  getIt.registerSingleton<ProcedureDataSource>(ProcedureDataSourceImpl());
  getIt.registerSingleton<ProcedureRepository>(
    ProcedureRepositoryImpl(dataSource: getIt<ProcedureDataSource>()),
  );

  getIt.registerSingleton<RecipeDataSource>(RecipeDataSourceImpl());
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(dataSource: getIt<RecipeDataSource>()),
  );

  getIt.registerSingleton<AuthDataSource>(AuthDataSourceImpl());
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(dataSource: getIt<AuthDataSource>()),
  );

  getIt.registerSingleton<BookMarkDataSource>(BookMarkDataSourceImpl());
  getIt.registerSingleton<BookMarkRepository>(
    BookMarkRepositoryImpl(dataSource: getIt<BookMarkDataSourceImpl>()),
  );

  // 유스케이스 등록
  getIt.registerSingleton<GetRecipeProcedureUseCase>(
    GetRecipeProcedureUseCase(repository: getIt<ProcedureRepository>()),
  );
  getIt.registerSingleton<GetUserInfoUseCase>(
    GetUserInfoUseCase(repository: getIt<UserRepository>()),
  );
  getIt.registerSingleton<GetLoginUserInfoUseCase>(
    GetLoginUserInfoUseCase(repository: getIt<AuthRepository>()),
  );
  getIt.registerSingleton<FetchRecipeUseCase>(
    FetchRecipeUseCase(repository: getIt<RecipeRepository>()),
  );
  getIt.registerSingleton<GetBookMarkedRecipesIdUseCase>(
    GetBookMarkedRecipesIdUseCase(repository: getIt<BookMarkRepository>()),
  );
  getIt.registerSingleton<GetRecipesByIdsUseCase>(
    GetRecipesByIdsUseCase(repository: getIt<RecipeRepository>()),
  );

  // 저장된 레시피 화면
  getIt.registerFactory(
    () => SavedRecipesViewModel(
      getLoginUserInfo: getIt<GetLoginUserInfoUseCase>(),
      getBookMarkedRecipesIdUseCase: getIt<GetBookMarkedRecipesIdUseCase>(),
      getRecipesByIdsUseCase: getIt<GetRecipesByIdsUseCase>(),
    ),
  );
  // 레시피 검색화면
  getIt.registerFactory(
    () => SearchRecipesViewModel(repository: getIt<RecipeRepository>()),
  );
  // 레시피 상세화면
  getIt.registerFactory(
    () => RecipeDetailViewModel(
      fetchRecipeUseCase: getIt<FetchRecipeUseCase>(),
      getRecipeProcedureUseCase: getIt<GetRecipeProcedureUseCase>(),
      getUserInfoUseCase: getIt<GetUserInfoUseCase>(),
    ),
  );
}
