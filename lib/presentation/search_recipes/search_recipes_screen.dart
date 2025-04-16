import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/recipe_thumbnail_card.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

import '../component/search_input_field.dart';
import '../ui/color_styles.dart';
import '../ui/text_styles.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        leading: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              context.pop();  // 지원된 기능 말고, 뒤로 돌아가기 구현.
            },
            child: SizedBox(
              width: 20,
              height: 20,
              child: Image.asset(
                'assets/icons/arrow-left.png',
                fit: BoxFit.contain,
              ),

            ),
          ),
        ),
        backgroundColor: ColorStyle.white,
        centerTitle: true,
        title: Text('Search recipes'),
        titleTextStyle: AppTextStyles.mediumBold.copyWith(
          color: ColorStyle.black,
        ),
      ),

      body: ListenableBuilder(
        listenable: viewModel..fetchRecipes(),
        builder: (context, child) {
          if (viewModel.state.isLoading) {
            return CircularProgressIndicator();
          }
          return Container(
            color: ColorStyle.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                bottom: 30.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        Expanded(
                          child: SearchInputField(
                            searchText: viewModel.state.searchKeyword,
                            focusNode: FocusNode(),
                            onValueChange: (changeValue) {
                              viewModel.search(changeValue);
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            // 버튼 클릭 시 동작
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorStyle.primary100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.zero, // 여백 제거 (선택)
                            minimumSize: Size(48, 48), // 버튼 크기 (선택)
                          ),
                          child: Image.asset(
                            'assets/icons/button_filter.png', // 이미지 경로
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ), // 공백 추가
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //왼쪽 텍스트
                        Text(
                          viewModel.state.searchKeyword.isNotEmpty
                              ? 'Search Result' : 'Recent Search',
                          style: AppTextStyles.normalBold,
                        ),
                        //오른쪽
                        Text(
                          viewModel.state.searchKeyword.isNotEmpty
                              ? '${viewModel.state.filteredRecipes.length} result' : '',
                          style: AppTextStyles.smallRegular.copyWith(
                            color: ColorStyle.gray3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 20), // 입력박스와 GridView 사이 여백
                  Expanded(
                    child: GridView.builder(
                      itemCount: viewModel.state.filteredRecipes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, //2열로 구성
                        mainAxisSpacing: 15, //위-아래 간격
                        crossAxisSpacing: 15, //좌-우 간격
                        childAspectRatio: 1 / 1, // 카드 비율 조절
                      ),
                      itemBuilder: (context, index) {
                        return RecipeThumbnailCard(
                          recipe: viewModel.state.filteredRecipes[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
