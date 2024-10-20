import 'package:film_zone/data/models/page_model.dart';
import 'package:film_zone/ui/widgets/film_grid_view.dart';
import 'package:film_zone/ui/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';

class LoadedCatalogPage extends StatelessWidget {
  const LoadedCatalogPage({
    super.key,
    required this.page,
    required this.onScrollEnd,
    required this.scrollController,
    required this.searchQuery,
  });

  final PageModel page;
  final String searchQuery;
  final ScrollController scrollController;
  final ValueChanged<int> onScrollEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (page.films.isEmpty)
          const EmptyStateWidget()
        else
          Expanded(
            child: FilmGridView(
              page: page,
              onPageChanged: onScrollEnd,
              searchQuery: searchQuery,
              scrollController: scrollController,
            ),
          ),
      ],
    );
  }
}
