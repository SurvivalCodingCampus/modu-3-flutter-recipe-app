import 'package:flutter/material.dart';

import 'filter_search_state.dart';

class FilterSearch extends StatefulWidget {
  final FilterSearchState state;

  final void Function(FilterSearchState state) onValueChange;

  const FilterSearch({
    super.key,
    required this.onValueChange,
    required this.state,
  });

  @override
  State<FilterSearch> createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  final textController = TextEditingController();
  bool _switchValue = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      textController.text = widget.state.value.toString();
      _switchValue = widget.state.switchValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: textController),
          Switch(
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              widget.onValueChange(
                FilterSearchState(
                  value: int.parse(textController.text),
                  switchValue: _switchValue,
                ),
              );
              Navigator.pop(context);
            },
            child: Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
