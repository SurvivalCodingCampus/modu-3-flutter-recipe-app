

import 'package:flutter/material.dart';

import '../../ui/color.dart';
import '../../ui/text.dart';
import '../recipe_detail/recipe_detail_view_model.dart';


class DetailRecipeCard extends StatelessWidget {
  final RecipeDetailViewModel viewModel;

  const DetailRecipeCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {} ,
                  child: SizedBox.expand(
                    child: Image.network(viewModel.state.recipe.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 60,
                          height: 24,
                          child: Row(
                            children: [
                              Image.asset('assets/images/stopwatch.png',
                                width: 16,
                                height: 16,
                              ),
                              SizedBox(width: 4),
                              Text(viewModel.state.recipe.time,
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Image.asset(
                            'assets/images/bookmark.png',
                            width: 24,
                            height: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 37,
                      height: 16,
                      decoration: BoxDecoration(
                        color: ColorStyles.secondary20,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: ColorStyles.rating, size: 10),
                          Text(viewModel.state.recipe.rating.toString(), style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: 200,
                  child: Text(viewModel.state.recipe.name,
                    style: TextStyles.smallerTextBold.copyWith(
                      fontSize: 15,
                    ),

                  ),
                ),
              ),
              Text('13k Reviews',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
