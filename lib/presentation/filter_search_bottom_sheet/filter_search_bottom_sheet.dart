import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/filter_search_bottom_sheet/filter_search_state.dart';
import 'package:recipe_app/presentation/filter_search_bottom_sheet/time_enum.dart';

import '../../2025-04-09/presentation/component/tabs.dart';


class FilterSearchBottomSheet extends StatefulWidget {
  final FilterSearchState state;
  final void Function(FilterSearchState) onSelected;

  const FilterSearchBottomSheet({super.key, required this.state, required this.onSelected});

  @override
  State<FilterSearchBottomSheet> createState() => _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  late FilterSearchState _state;

  @override
  void initState(){
    super.initState();
    _state = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    final timeLabels = TimeFilter.values.map((e) => e.label).toList();
    final selectedTimeIndex = TimeFilter.values.indexOf(_state.time);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Filter Search',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text('Time',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: 8),
          TabsWidget(
            labels: timeLabels,
            onValueChange: (index) {
              setState(() {
                _state = _state.copyWith(time: TimeFilter.values[index]);
              });
            }, selectedindex: selectedTimeIndex,
          ),
        ],
      ),
    );
  }
}
