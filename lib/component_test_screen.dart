import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/filter_icon_button.dart';
import 'package:recipe_app/presentation/component/medium_button.dart';
import 'package:recipe_app/presentation/component/search_text_field.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/ui/ui.dart';

import 'presentation/component/filter_button.dart';
import 'presentation/component/ingredient_item.dart';
import 'presentation/component/label_input_field.dart';
import 'presentation/component/rating_button.dart';
import 'presentation/component/rating_dialog.dart';
import 'presentation/component/recipe_card.dart';
import 'presentation/component/tabs.dart';

class ComponentTestScreen extends StatefulWidget {
  const ComponentTestScreen({super.key});

  @override
  State<ComponentTestScreen> createState() => _ComponentTestScreenState();
}

class _ComponentTestScreenState extends State<ComponentTestScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: ColorStyles.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const BigButton(text: 'Button'),
                  const SizedBox(height: 10),
                  const MediumButton(text: 'Button'),
                  const SizedBox(height: 10),
                  const SmallButton(text: 'Button'),
                  const SizedBox(height: 10),
                  LabelInputField(
                    label: 'label',
                    placeholder: 'hintText',
                    onValueChange: (String value) {
                      print(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Tabs(
                    labels: const ['one', 'two', 'three'],
                    selectedIndex: 0,
                    onTap: (int index) {
                      print(index);
                    },
                  ),
                  const SizedBox(height: 10),
                  const IngredientItem(
                    ingredient: Ingredient(
                      id: '1',
                      name: 'Tomato',
                      imageUrl:
                          'https://s3-alpha-sig.figma.com/img/3c30/4e61/3dd3e1dd1f7360a6ef1c04399b0609ab?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Z1o~faIwyt6-juKGeztJ2D8GDEM66ccRS8CMg0e4-Ldw9tXRosaROZFDCQrLROVxG9RuaxwLP5ZjfgM7fRROYE4OVoiEQWdPjxN~9cWWWzFiG79eK-ZeDreGZBlJ39ps1vi~gaImP6HY83~-MVt7rBouxK2LvI9y2T-dnIbJzpO3FKVDyL~BQ328ez6-5Ef40tsgLqIlb3JCcClbRpDU5sh0fd4YhRTM88ELeC1brmBVIwJukIy85zZWy88zprw78~fpQ8eu9uPHFDq8j677ng4J7fO942x19hUwK9zgxiQe9R2EDS60ZOTydWh12UYGDq6MiAz~tDjcYV0mEUQm9Q__',
                      weight: 500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const RecipeCard(
                    recipe: Recipe(
                      id: "1",
                      name: "Traditional spare ribs baked",
                      imageUrl:
                          'https://s3-alpha-sig.figma.com/img/2234/134e/6e53ef9148ab9085bbd1369e270f0bba?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=MFmWJPcr~S4mh9WZtwWrqEqi2iaItszN9hde5ATAClpO9HPQFOZ1YQBXCWRQtdVR-SgDPhiXai7Et3yr~cs3A2hpQw6mkApsxCgBCXROKw7sobH0tPMy5ugzYnTZm-8KuSt9OCbRtbuRnxBk3167G-bW5GyLdD0CThkHAuSvsaJFqwWSiNXc7L41KCo~E5ggWwruRP8VlGYo8DFjHHGveknq0raaVJvKvIDPbobibULGUxTlZi7KmQoyn3-i4Ffm6WksF9RarsiENZbx60cQ2resR2R1iogEqEnFNVeHCmKftkhMdlXzgN9xzMREmWaE7M14hKG6n4EIwpO1javB5A__',
                      chef: 'By Chef John',
                      totalTimeMinutes: '20',
                      rating: 4.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const RatingButton(rating: 5, isSelected: false),
                  const SizedBox(height: 10),
                  FilterButton(text: 'text', isSelected: false, onTap: () {}),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const RatingDialog(title: 'Rate Recipe');
                        },
                      );
                    },
                    child: const Text("Open Rating Dialog"),
                  ),
                  const SizedBox(height: 10),
                  const SearchTextField(placeholder: 'Placeholder'),
                  const SizedBox(height: 10),
                  const FilterIconButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
