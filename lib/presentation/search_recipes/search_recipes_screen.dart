import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/filter_search.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

import '../component/filter_search_state.dart';

void main() {
  runApp(
    MaterialApp(home: SearchRecipesScreen(viewModel: SearchRecipesViewModel())),
  );
}

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search recipes')),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              children: [
                Text(
                  '${viewModel.state.filterSearchState.value}',
                  style: TextStyle(fontSize: 40),
                ),
                ElevatedButton(
                  onPressed: () {
                    // viewModel.setValue(10);
                  },
                  child: Text('test'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FilterSearch(
                          onValueChange: (FilterSearchState state) {
                            viewModel.setValue(state);
                          },
                          state: viewModel.state.filterSearchState,
                        );
                      },
                    );
                  },
                  child: Text('show Dialog'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
