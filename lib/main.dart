import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/presentation/common/component/color_change_text_button.dart';
import 'package:recipe_app/presentation/common/component/filter_button.dart';
import 'package:recipe_app/presentation/common/component/ingredient_item.dart';
import 'package:recipe_app/presentation/common/component/rating_button.dart';
import 'package:recipe_app/presentation/common/component/recipe_card.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<String> labels = ["Label1", "Label2"];

  final List<Map<String, dynamic>> sampleImageList = [
    {
      'imagePath':
          'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
      'imageType': ImageType.network,
    },
    {
      'imagePath':
          'https://cdn.pixabay.com/photo/2019/05/15/18/56/pizza-4205701_1280.jpg',
      'imageType': ImageType.network,
    },
    {
      'imagePath':
          'https://cdn.pixabay.com/photo/2017/10/15/11/41/sushi-2853382_1280.jpg',
      'imageType': ImageType.network,
    },
    {
      'imagePath':
          'https://cdn.pixabay.com/photo/2016/03/03/16/19/food-1234483_1280.jpg',
      'imageType': ImageType.network,
    },
    {
      'imagePath':
          'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
      'imageType': ImageType.network,
    },
    {'imagePath': 'assets/sample_image/lemon.png', 'imageType': ImageType.path},
    {
      'imagePath': 'assets/sample_image/strawberry.png',
      'imageType': ImageType.path,
    },
    {
      'imagePath': 'assets/sample_image/tomato.jpg',
      'imageType': ImageType.path,
    },
  ];

  bool filterButtonSelected = false;
  bool ratingButtonSelected = false;
  int tabActiveInt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IngredientItem(
                          backgroundColor: ColorStyle.gray4,
                          imagePath: 'assets/sample_image/strawberry.png',
                          imageType: ImageType.path,
                          name: 'StrawBerry',
                          content: '500g',
                        ),
                        SizedBox(height: 10),
                        IngredientItem(
                          backgroundColor: ColorStyle.gray4,
                          imagePath: 'assets/sample_image/lemon.png',
                          imageType: ImageType.path,
                          name: 'Lemon',
                          content: '500g',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children:
                          sampleImageList.map((image) {
                            return RecipeCard(
                              recipeName: 'test',
                              recipeAuthor: 'Author',
                              imagePath: image["imagePath"],
                              recipeTime: 20,
                              recipeRate: 30,
                              imageType: image["imageType"],
                            );
                          }).toList(),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: FilterButton(
                            text: 'Text',
                            isSelected: filterButtonSelected,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: FilterButton(
                            text: 'Text',
                            isSelected: !filterButtonSelected,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: RatingButton(
                            text: 'Text',
                            isSelected: ratingButtonSelected,
                            icon: Icons.star,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: RatingButton(
                            text: 'Text',
                            isSelected: !ratingButtonSelected,
                            icon: Icons.star,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: ColorChangeTextButton(
                      buttonHeight: 60,
                      buttonWidth: double.infinity,
                      buttonText: 'Button',
                      buttonColor:
                          tabActiveInt == 0
                              ? ColorStyle.primary100
                              : ColorStyle.gray4,
                      textColor:  ColorStyle.white,
                      tabActive: tabActiveInt,
                      buttonRadius: 10,
                      onTapDown: (details) {
                        setState(() {
                          tabActiveInt = 1;
                        });
                      },
                      onTapUp: (details) {
                        setState(() {
                          tabActiveInt = 0;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          tabActiveInt = 0;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
