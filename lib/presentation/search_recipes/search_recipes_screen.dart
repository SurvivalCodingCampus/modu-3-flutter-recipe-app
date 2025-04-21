import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/filter_search.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_event.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

import '../component/filter_search_state.dart';

void main() {
  runApp(
    MaterialApp(home: SearchRecipesScreen(viewModel: SearchRecipesViewModel())),
  );
}

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({super.key, required this.viewModel});

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowDialog():
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(content: Text(event.message));
              },
            );
          case networkError():
            final snackBar = SnackBar(content: Text(event.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case ShowSnackbar():
            context.go('/');
          case timeoutError():
            print(event.message);
        }
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search recipes')),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              children: [
                Text(
                  '${widget.viewModel.state.filterSearchState.value}',
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
                            widget.viewModel.setValue(state);
                          },
                          state: widget.viewModel.state.filterSearchState,
                        );
                      },
                    );
                  },
                  child: Text('show Dialog'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.push('/');
                  },
                  child: Text('push'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.go('/');
                  },
                  child: Text('go'),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.viewModel.onError2();
                  },
                  child: Text('1회성 UI 이벤트 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.viewModel.onNetworkError();
                  },
                  child: Text('1회성 UI 이벤트 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.viewModel.onError3();
                  },
                  child: Text('1회성 UI 이벤트 3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.viewModel.onError4();
                  },
                  child: Text('1회성 UI 이벤트 4'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
