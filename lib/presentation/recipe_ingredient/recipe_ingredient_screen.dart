import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/presentation/component/tabs.dart';
import 'package:recipe_app/ui/ui.dart';

class RecipeIngredientScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeIngredientScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset('assets/icons/more.png', width: 24, height: 24),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 10),
              RecipeCard(recipe: recipe, isDetail: true),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(recipe.name, style: TextStyles.smallTextBold),
                  const Text('(13k Reviews)'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://s3-alpha-sig.figma.com/img/9b37/65ef/6e15f500f33fd641033e430dabb8ea4e?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=AD-vImsZOWebNs~fh5DUtAgXqr9NkCvl8jnlO5ZTpZLVJKjWMGSGILzMRJMoZHZrYSlnx6eTmb6kkeLm5gYfcCem5xhpmJ0yYdLZ~vmzS9A~n7zodEos4r4iM67YyauVBIdY5qGaBpoH2lMwD3LKLt45Fx4iSV~okHrYv6zSTlV1vxe~CLhI-lUAtuGYhgKu05eIFim~QeqlpI8LNPN0TKLbJvaiVQYFXGsmex95UZIw6nbwea-1~jMq7vZcPGL-HmQQzeR0Ox22gx79v3TI1phDpHl1r4XyM7SMssOV78Kkf2~0blGy7GVbx9F2~tWIP-OB~1YIoz-SQOZKYtPP6Q__',
                      scale: 40,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      const Text(
                        'Laura wilson',
                        style: TextStyles.smallTextBold,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/location.png',
                            width: 17,
                            height: 17,
                          ),
                          const SizedBox(width: 1),
                          Text(
                            'Lagos, Nigeria',
                            style: TextStyles.smallerTextRegular.copyWith(
                              color: ColorStyles.gray3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SizedBox(width: 85, child: SmallButton(text: 'Follow')),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Tabs(
                  labels: const ['Ingredient', 'Procedure'],
                  selectedIndex: 0,
                  onTap: (index) {},
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Image.asset('assets/icons/serve.png', width: 17, height: 17),
                  const SizedBox(width: 5),
                  Text(
                    '1 serve',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: ColorStyles.gray3,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '10 Items',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: ColorStyles.gray3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return IngredientItem(
                      ingredient: Ingredient(
                        id: index.toString(),
                        name: 'Tomato',
                        imageUrl:
                            'https://s3-alpha-sig.figma.com/img/3c30/4e61/3dd3e1dd1f7360a6ef1c04399b0609ab?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=OPRtyxA9k7b3UekTmhKQDr8tnMuQCdVuw9spBzYG83pIwlPwdnpnP2KiuEXFP2Ix8SI8thJbZYl~k178orTPpcVsUaIwDHEd7oKF3nV6rivBXDGUTgm3yql72L6B6RLwAIP91kCT1xJf1SuR3KiC0whdViOWLrKkHQYrBZIYHITNe9FnMhyWKZ73XMXKPUCX9qtix~wVEDYwlzsx-82NIhuPOfqfzYEsSKVN6AbXlKYRb3TAEA~xGRSUn48mmpFlkjfJQgD1RxgO9prJeqPB5A~LmNsRWxqpkBPtxqIkirFp5fIUNwNQKCZuWmNqJAR9nSbRXRrEwidrRDUWaT1EUQ__',
                        weight: 500,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
