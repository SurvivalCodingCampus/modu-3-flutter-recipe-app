import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/presentation/common/component/ingredient_item.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

class DetailRecipesScreen extends StatelessWidget {
  final Recipe recipesData;
  const DetailRecipesScreen({super.key, required this.recipesData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBar(
        backgroundColor: ColorStyle.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: Stack(children: [pageWidget()]),
    );
  }



  Widget pageWidget() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(recipesData.image, fit: BoxFit.cover),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipesData.name,
                  style: AppTextStyles.smallBold(),
                  maxLines: 2,
                ),
                Text(
                  '(13k Reviews)',
                  style: AppTextStyles.normalRegular().copyWith(fontSize: 14),
                ),
              ],
            ),
            Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Row(
                    spacing: 5,
                    children: [
                      CircleAvatar(backgroundColor: ColorStyle.gray4),
                      Text(recipesData.author),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        ColorStyle.primary100,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Follow',
                      style: AppTextStyles.smallBold(color: ColorStyle.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1 serve',
                  style: AppTextStyles.smallRegular(color: ColorStyle.gray3),
                ),
                Text(
                  '${recipesData.ingredients.length} items',
                  style: AppTextStyles.smallRegular(color: ColorStyle.gray3),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children:
                    recipesData.ingredients
                        .map(
                          (items) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: IngredientItem(
                              backgroundColor: ColorStyle.gray4,
                              imagePath: items.ingredient!.image.toString(),
                              imageType: ImageType.network,
                              name: items.ingredient!.name.toString(),
                              content: items.ingredient!.id.toString(),
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
