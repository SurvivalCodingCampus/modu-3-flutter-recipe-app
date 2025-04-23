import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/presentation/common/component/filter_button.dart';
import 'package:recipe_app/presentation/common/component/nav_bar_component.dart';
import 'package:recipe_app/presentation/common/component/recipe_card.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';
import 'package:recipe_app/presentation/page/home/home_screen_action.dart';
import 'package:recipe_app/presentation/page/home/home_state.dart';
import 'package:recipe_app/presentation/page/home/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  final HomeState state;
  final void Function(HomeScreenAction action) onAction;
  const HomeScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello Jega,', style: AppTextStyles.largeBold()),
                    Text(
                      'What are you cooking today?,',
                      style: AppTextStyles.smallRegular(),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorStyle.secondary100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "🧑️",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    autofocus: false,
                    onTap: () {
                      print("state.searchData ${state.searchData}");
                      context.push("/search", extra: state.searchData).then((
                        value,
                      ) {
                        if (value != null) {
                          final result = (value as List).cast<Recipe>();

                          onAction(
                            HomeScreenAction.onTapSearchBar(searchData: result),
                          );

                          // print("result $result");
                          // viewModel.getSearchData(
                          //   searchData:
                          //   result
                          //       .map((items) => items.toJson())
                          //       .toList(),
                          // );
                        }
                      });
                    },

                    decoration: InputDecoration(
                      constraints: BoxConstraints(maxHeight: 40),
                      hintText: 'Search recipe',
                      hintStyle: AppTextStyles.smallRegular(
                        color: ColorStyle.gray4,
                      ),
                      prefixIcon: Container(
                        constraints: BoxConstraints(
                          maxHeight: 18,
                          maxWidth: 18,
                        ),
                        width: 18,
                        height: 18,
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Image.asset(
                          'assets/icons/search-normal.png',

                          fit: BoxFit.contain,
                          color: ColorStyle.gray4,
                        ),
                      ),
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: ColorStyle.gray4,
                          width: 1.3,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: ColorStyle.gray4,
                          width: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorStyle.primary100,
                    ),

                    height: 40,
                    width: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset('assets/icons/setting.png'),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 15,
                children:
                    state.categoryList
                        .map(
                          (items) => FilterButton(
                            onTap: () {
                              onAction(
                                HomeScreenAction.onTapCategoryBadge(
                                  selectString: items,
                                ),
                              );
                            },
                            text: items,
                            isSelected: items == state.selectCategory,
                          ),
                        )
                        .toList(),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 15,
                children:
                    state.categoryFilterRecipeList.map((items) {
                      return SizedBox(
                        width:
                            (MediaQuery.of(context).size.width - 40 - 15 * 3) /
                            2,
                        child: ColumnSuper(
                          alignment: Alignment.center,
                          invert: true,
                          innerDistance: -55,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 109,
                                height: 110,
                                // margin: EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(items.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 1 / 1.2,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 66,
                                    left: 10,
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorStyle.gray4,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        items.name,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.smallBold(
                                          color: ColorStyle.gray1,
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Time',
                                                style:
                                                    AppTextStyles.smallRegular(
                                                      color: ColorStyle.gray3,
                                                    ),
                                              ),
                                              Text(
                                                items.time,
                                                style:
                                                AppTextStyles.smallBold(
                                                  color: ColorStyle.gray1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
