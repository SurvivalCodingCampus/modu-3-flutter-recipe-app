import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/common/component/nav_bar_component.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';
import 'package:recipe_app/presentation/page/home/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
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
                            Text(
                              'Hello Jega,',
                              style: AppTextStyles.largeBold(),
                            ),
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
                              print("viewModel.state.searchData ${viewModel.state.searchData}");
                              context.push("/search", extra: viewModel.state.searchData).then((value) {
                                if(value != null) {
                                  final result = (value as List).cast<Map<String, dynamic>>();
                                  print("result $result");
                                  viewModel.getSearchData(searchData: result);
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
                                padding: const EdgeInsets.only(
                                  right: 10,
                                  left: 10,
                                ),
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
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
