import 'package:flutter/material.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/component/pages/home/splash_screen.dart';
import 'package:recipe_app/presentation/component/pages/home/main_screen.dart';
import 'package:recipe_app/presentation/component/pages/recipe/recipes_screen.dart';
import 'package:recipe_app/presentation/component/pages/recipe/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/color_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  final int initialTabIndex;
  const MainScaffold({super.key, this.initialTabIndex = 0});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  late int selectedIndex;
  late final SavedRecipesViewModel viewModel;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialTabIndex;

    // ViewModel을 한 번만 생성해서 하위 페이지에 공유
    viewModel = SavedRecipesViewModel(
      RecipeRepositoryImpl(
        RecipeDataSourceImpl(),
      ),
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
      MainScreen(),   // 0: 홈 탭
      RecipesScreen(viewModel: viewModel), // 1: 레시피 탭
      Container(color: Colors.white),     // 2: 즐겨찾기
      Container(color: Colors.white),     // 3: 설정
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
