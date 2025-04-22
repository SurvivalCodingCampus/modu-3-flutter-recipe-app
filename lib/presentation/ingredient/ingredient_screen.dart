import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/tabs.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_state.dart';

import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class IngredientScreen extends StatefulWidget {
  final IngredientState state;
  const IngredientScreen({super.key, required this.state});

  @override
  State<IngredientScreen> createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    RecipeCard(
                      recipe: widget.state.recipe,
                      isBig: true,
                      isBookmarked: true,
                      isIngredient: true,
                      bookMarkCallback: () {},
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          child: Text(
                            widget.state.recipe.title,
                            maxLines: 2,
                            style: TextStyles.smallTextBold,
                          ),
                        ),
                        Text(
                          '(13k Reviews)',
                          style: TextStyles.smallTextRegular.copyWith(
                            color: ColorStyles.gray3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    widget
                                            
                                            .state
                                            .userModel
                                            .image
                                            .isNotEmpty
                                        ? NetworkImage(
                                          widget
                                              
                                              .state
                                              .userModel
                                              .image,
                                        )
                                        : null,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.state.userModel.name,
                                    style: TextStyles.smallTextBold,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        color: ColorStyles.primary100,
                                      ),
                                      Text(
                                        widget
                                            
                                            .state
                                            .userModel
                                            .address,
                                        style: TextStyles.smallerTextRegular
                                            .copyWith(color: ColorStyles.gray3),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 85,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorStyles.primary100,
                          ),
                          child: Center(
                            child: Text(
                              "Follow",
                              style: TextStyles.smallerTextBold.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Tabs(
                      labels: ["Ingredient", "Procedure"],
                      selectedIndex: 0,
                      onValueChange: (int value) {
                        setState(() {
                          selectedIndex = value;
                        });
                      },
                    ),
                    SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Icon(
                                Icons.room_service,
                                color: ColorStyles.gray3,
                              ),
                              Text(
                                "1 serve",
                                style: TextStyles.smallerTextRegular.copyWith(
                                  color: ColorStyles.gray3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${widget.state.recipe.ingredients.length} Items",
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: ColorStyles.gray3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    if (selectedIndex == 0)
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return IngredientItem(
                            ingredients:
                                widget
                                    
                                    .state
                                    .recipe
                                    .ingredients[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        itemCount:
                            widget.state.recipe.ingredients.length,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );

  }
}
