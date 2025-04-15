import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/pages/filtter/filtter_search_state.dart';
import 'package:recipe_app/ui/color_style.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final Function(Map<String, dynamic>) onApplyFilter;

  const FilterSearchBottomSheet({
    super.key,
    required this.onApplyFilter,
  });

  // 바텀시트를 표시하는 편리한 정적 메서드
  static Future<void> show(
    BuildContext context, {
    required Function(Map<String, dynamic>) onApplyFilter,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 전체 높이 사용 가능
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.65, // 화면의 65% 높이
        minChildSize: 0.5, // 최소 50% 높이
        maxChildSize: 0.95, // 최대 95% 높이
        expand: false,
        builder: (context, scrollController) {
          return FilterSearchBottomSheet(
            onApplyFilter: onApplyFilter,
          );
        },
      ),
    );
  }

  @override
  State<FilterSearchBottomSheet> createState() => _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  final FilterSearchState _filterState = FilterSearchState();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 제목
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Filter Search',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // 시간 필터
          _buildSectionTitle('Time'),
          const SizedBox(height: 12),
          _buildTimeFilter(),
          const SizedBox(height: 24),

          // 평점 필터
          _buildSectionTitle('Rate'),
          const SizedBox(height: 12),
          _buildRatingFilter(),
          const SizedBox(height: 24),

          // 카테고리 필터
          _buildSectionTitle('Category'),
          const SizedBox(height: 12),
          _buildCategoryFilter(),
          const SizedBox(height: 32),

          // 필터 적용 버튼
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorStyle.mainGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // 선택된 필터 값을 콜백으로 전달
                final selectedFilters = _filterState.getSelectedFilters();
                widget.onApplyFilter(selectedFilters);
                Navigator.pop(context); // 바텀시트 닫기
              },
              child: const Text(
                'Filter',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // 하단 인디케이터
          Center(
            child: Container(
              width: 120,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTimeFilter() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(_filterState.timeOptions.length, (index) {
        final isSelected = _filterState.selectedTimeIndex == index;
        
        return GestureDetector(
          onTap: () {
            setState(() {
              _filterState.toggleTimeFilter(index);
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? ColorStyle.mainGreen : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorStyle.mainGreen,
                width: 1,
              ),
            ),
            child: Text(
              _filterState.timeOptions[index],
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : ColorStyle.mainGreen,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildRatingFilter() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(_filterState.ratingOptions.length, (index) {
        final rating = _filterState.ratingOptions[index];
        final isSelected = _filterState.selectedRatingIndex == index;
        
        return GestureDetector(
          onTap: () {
            setState(() {
              _filterState.toggleRatingFilter(index);
            });
          },
          child: Container(
            width: 60,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? ColorStyle.mainGreen : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorStyle.mainGreen,
                width: 1,
              ),
            ),
            child: Text(
              '$rating ★',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : ColorStyle.mainGreen,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCategoryFilter() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(_filterState.categoryOptions.length, (index) {
        final isSelected = _filterState.selectedCategories[index];
        final category = _filterState.categoryOptions[index];
        // Dinner 카테고리는 별 아이콘 표시
        final bool showStar = category == 'Dinner';
        
        return GestureDetector(
          onTap: () {
            setState(() {
              _filterState.toggleCategoryFilter(index);
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? ColorStyle.mainGreen : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorStyle.mainGreen,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : ColorStyle.mainGreen,
                  ),
                ),
                if (showStar) ...[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.star,
                    size: 12,
                    color: isSelected ? Colors.white : ColorStyle.mainGreen,
                  ),
                ],
              ],
            ),
          ),
        );
      }),
    );
  }
}