import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';
import 'package:recipe_app/app/ui/color_style.dart';
import 'package:recipe_app/data/data_source/chef_data_source.dart';
import 'package:recipe_app/data/data_source/chef_data_source_impl.dart';
import 'package:recipe_app/domain/entity/chef.dart';
import 'package:recipe_app/domain/entity/recipe_model.dart';
import 'package:recipe_app/presentation/widget/ingredient_item.dart';
import 'package:recipe_app/presentation/widget/recipe_card.dart';

class IngredientScreen extends StatefulWidget { // StatefulWidget으로 변경
  final Recipe recipe;

  const IngredientScreen({super.key, required this.recipe});

  @override
  State<IngredientScreen> createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {
  final ChefDataSource _chefDataSource = ChefDataSourceImpl();
  Chef? chef;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadChef();
  }

  Future<void> _loadChef() async {
    // 레시피에 저장된 chef 이름을 기반으로 chef ID를 검색
    // 실제 구현에서는 Recipe 모델에 chefId가 포함되어 있을 것입니다
    final chefs = await _chefDataSource.getAllChefs();
    
    // 이름으로 chef 찾기 (실제로는 ID로 찾아야 함)
    final matchedChef = chefs.firstWhere(
      (c) => c.name == widget.recipe.chef,
      orElse: () => Chef(id: 0, name: widget.recipe.chef, image: '', address: '위치 정보 없음'),
    );
    
    setState(() {
      chef = matchedChef;
      isLoading = false;
    });
  }

  int _extractMinutes(String time) {
    final match = RegExp(r'\d+').firstMatch(time);
    return match != null ? int.parse(match.group(0)!) : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 44),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.pop(),
                ),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
            const SizedBox(height: 10),
            RecipeCard(
              recipeName: widget.recipe.name,
              chefName: widget.recipe.chef,
              recipeImgUrl: widget.recipe.image,
              recipeTime: _extractMinutes(widget.recipe.time),
              recipeRating: widget.recipe.rating,
              isBookmarked: false,
              onBookmarkTap: () {},
              onTap: () {},
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 194,
                  height: 41,
                  child: Text(
                    widget.recipe.name,
                    style: AppTextStyles.smallBold(color: ColorStyle.black1),
                  ),
                ),
                const Spacer(),
                Text(
                  '(13k Reviews)',
                  style: AppTextStyles.smallRegular(color: ColorStyle.gray2),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              height: 40,
              color: ColorStyle.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isLoading
                      ? const SizedBox(
                          width: 40,
                          height: 40,
                          child: Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 5),
                            ),
                          ),
                        )
                      : Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.blue.shade200),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: chef?.image != null && chef!.image.isNotEmpty
                                    ? Image.network(
                                        chef!.image,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Icon(Icons.person, color: Colors.grey);
                                        },
                                      )
                                    : const Icon(Icons.person, color: Colors.grey),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chef!.name,
                                  style: AppTextStyles.smallBold(color: ColorStyle.black1),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 14,
                                      color: ColorStyle.primary80,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      chef!.address,
                                      style: AppTextStyles.extraSmallRegular(color: ColorStyle.gray2),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text('Follow'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            /// 🔽 recipe.ingredients를 그대로 출력
            Expanded(
              child: ListView(
                children: widget.recipe.ingredients
                    .map(
                      (ri) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: IngredientItem(
                          ingredientName: ri.ingredient.name,
                          ingredientImgUrl: ri.ingredient.image,
                          ingredientWeight: ri.amount,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}