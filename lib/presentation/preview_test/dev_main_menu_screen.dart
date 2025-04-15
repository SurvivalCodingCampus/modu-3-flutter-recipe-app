// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';
import 'component_preview.dart';
import 'login_preview_transformed.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🍽️ 개발자용 메뉴')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMenuButton(
              context,
              title: '스플래시 화면',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SplashScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildMenuButton(
              context,
              title: '저장된 레시피 화면',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SavedRecipesScreen.withMock(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildMenuButton(
              context,
              title: '레시피 검색 화면',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SearchRecipesScreen.withMock(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildMenuButton(
              context,
              title: '위젯 컴포넌트 프리뷰',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WidgetPreviewApp()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildMenuButton(
              context,
              title: '로그인 화면',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black54,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
