import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/ui/color_styles.dart';

import '../../../ui/text_styles.dart';
import '../../component/category_tabs.dart';
import '../../component/filter_small_button.dart';
import '../../component/recommend_card.dart';
import 'home_view_model.dart';

class Home extends StatefulWidget {
  final HomeViewModel viewModel;

  const Home({super.key, required this.viewModel});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (BuildContext context, Widget? child) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            children: [
              const SizedBox(height: 90),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Jega',
                        style: TextStyles.largeBold.copyWith(fontSize: 20),
                      ),
                      Text(
                        'what are you cooking today?',
                        style: TextStyles.smallerRegular.copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorStyles.secondary40,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/men.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Row(
                children: [
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 45),
                      child: TextField(
                        style: TextStyles.smallerRegular.copyWith(fontSize: 11),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: 'Search recipe',
                          hintStyle: TextStyles.smallerRegular.copyWith(
                            color: ColorStyles.gray4,
                            fontSize: 11,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: ColorStyles.gray4,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorStyles.gray4,
                              width: 1.3,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorStyles.gray4),
                          ),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FilterSmallButton(onTap: () {}),
                ],
              ),

              const SizedBox(height: 30),

              CategoryTabs(
                categories: widget.viewModel.state.categoryList,
                onSelected: (category) {
                  widget.viewModel.updateCategory(category);
                },
              ),

              const SizedBox(height: 30),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.viewModel.state.filteredRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe =
                        widget.viewModel.state.filteredRecipes[index];
                    return RecommendCard(
                      category: recipe.category,
                      imageUrl: recipe.imageUrl,
                      name: recipe.name,
                      rating: recipe.rating,
                      time: recipe.time,
                      isBookMarked: recipe.isBookMarked,
                      onTap: () {
                        context.push('/detail', extra: recipe);
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
