import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/label_input_field.dart';
import 'package:recipe_app/presentation/component/medium_button.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/presentation/component/tabs.dart';
import 'package:recipe_app/ui/ui.dart';

import 'presentation/component/ingrident_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const ComponentsWidget(),
    );
  }
}

class ComponentsWidget extends StatelessWidget {
  const ComponentsWidget({super.key});

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
                  BigButton(
                    text: 'Button',
                    onTap: () {
                      print('Big Button Pressed');
                    },
                  ),
                  const SizedBox(height: 10),
                  MediumButton(
                    text: 'Button',
                    onTap: () {
                      print('Medium Button Pressed');
                    },
                  ),
                  const SizedBox(height: 10),
                  SmallButton(
                    text: 'Button',
                    onTap: () {
                      print('Small Button Pressed');
                    },
                  ),
                  const SizedBox(height: 10),
                  LabelInputField(
                    label: 'label',
                    hintText: 'hintText',
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
                  const IngridentItem(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
