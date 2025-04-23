import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository_impl/bookmark_repository_impl.dart';
import 'package:recipe_app/domain/usecase/get_saved_recipes_usecase_impl.dart';
import 'package:recipe_app/domain/usecase/unbookmark_recipe_usecase_impl.dart';
import 'package:recipe_app/presentation/screen/home/home_screen.dart';
import 'package:recipe_app/presentation/screen/recipe/recipes_screen_root.dart';
import 'package:recipe_app/presentation/screen/recipe/saved_recipes_view_model.dart';
import 'package:recipe_app/data/repository_impl/recipe_repository_impl.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/app/ui/color_style.dart';

class MainScreen extends StatefulWidget {
  final int initialTabIndex;
  const MainScreen({super.key, this.initialTabIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int selectedIndex;
  late final SavedRecipesViewModel viewModel;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialTabIndex;

    final recipeDataSource = RecipeDataSourceImpl();
    final recipeRepository = RecipeRepositoryImpl(recipeDataSource);
    final getSavedRecipesUseCase = GetSavedRecipesUseCaseImpl(recipeRepository);

    final bookmarkRepository = BookmarkRepositoryImpl(); // 실제 구현체
    final unbookmarkUseCase = UnbookmarkRecipeUseCaseImpl(bookmarkRepository);

    viewModel = SavedRecipesViewModel(
      getSavedRecipesUseCase,
      unbookmarkUseCase,
      bookmarkRepository,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeScreen(), // 홈
      RecipesScreenRoot(viewModel: viewModel),
      const Placeholder(), // 즐겨찾기
      const Placeholder(), // 설정
    ];

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: ColorStyle.mainGreen),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu, color: ColorStyle.mainGreen),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: ColorStyle.mainGreen),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: ColorStyle.mainGreen),
            label: '',
          ),
        ],
      ),
    );
  }
}
