import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search/search_action.dart';
import 'package:recipe_app/presentation/search/search_screen.dart';
import 'package:recipe_app/presentation/search/search_view_model.dart';
import 'package:recipe_app/ui/ui.dart';

import '../component/filter_dialog.dart';

class SearchScreenRoot extends StatefulWidget {
  final SearchViewModel viewModel;

  const SearchScreenRoot({super.key, required this.viewModel});

  @override
  State<SearchScreenRoot> createState() => _SearchScreenRootState();
}

class _SearchScreenRootState extends State<SearchScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getRecentSearchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.white,
        surfaceTintColor: ColorStyles.white,
        title: const Text('Search recipes', style: TextStyles.mediumTextBold),
        centerTitle: true,
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, snapshot) {
          return SearchScreen(
            state: widget.viewModel.state,
            onAction: (action) {
              switch (action) {
                case SearchRecipes():
                  widget.viewModel.searchRecipes(action.query);
                case OnTapFilter():
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return FilterDialog(
                        filter: widget.viewModel.state.filter,
                        onTapFilter: (filter) {
                          widget.viewModel.onChangeFilter(filter);
                        },
                      );
                    },
                  );
              }
            },
          );
        },
      ),
    );
  }
}
