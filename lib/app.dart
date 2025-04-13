import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/alert/rating_dialog.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/pushed_button/big_tap_button.dart';
import 'package:recipe_app/presentation/component/pushed_button/medium_tap_button.dart';
import 'package:recipe_app/presentation/component/pushed_button/small_tap_button.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigTapButton(text: 'Button'),
                SizedBox(height: 10),
                MediumTapButton(text: 'Button'),
                SizedBox(height: 10),
                SmallTapButton(text: 'Button'),
                SizedBox(height: 10),
                InputField(label: '검색', holder: '검색어를 입력해주세요'),
                SizedBox(height: 10),
                IngredientItem(
                  ingredientImage:
                      'https://s3-alpha-sig.figma.com/img/3c30/4e61/3dd3e1dd1f7360a6ef1c04399b0609ab?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Z1o~faIwyt6-juKGeztJ2D8GDEM66ccRS8CMg0e4-Ldw9tXRosaROZFDCQrLROVxG9RuaxwLP5ZjfgM7fRROYE4OVoiEQWdPjxN~9cWWWzFiG79eK-ZeDreGZBlJ39ps1vi~gaImP6HY83~-MVt7rBouxK2LvI9y2T-dnIbJzpO3FKVDyL~BQ328ez6-5Ef40tsgLqIlb3JCcClbRpDU5sh0fd4YhRTM88ELeC1brmBVIwJukIy85zZWy88zprw78~fpQ8eu9uPHFDq8j677ng4J7fO942x19hUwK9zgxiQe9R2EDS60ZOTydWh12UYGDq6MiAz~tDjcYV0mEUQm9Q__',
                  ingredientName: '토마토',
                  ingredientQuantity: '500g',
                ),
                SizedBox(height: 10),
                RatingButton(rate: 5),
                SizedBox(height: 10),
                RatingButton(rate: 4),
                SizedBox(height: 10),
                FilterButton(text: ['All', 'Breakfast', 'Lunch', 'Dinner']),
                SizedBox(height: 10),
                FilterButton(text: ['계절', '봄', '여름', '가을', '겨울']),
                SizedBox(height: 10),
                RatingDialog(title: '별점', actionName: '보내기'),
                SizedBox(height: 10),
                RatingDialog(title: 'Rate recipe', actionName: 'Send'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
