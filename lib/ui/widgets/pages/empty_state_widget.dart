import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/ui/widgets/film_grid_view.dart';
import 'package:film_zone/ui/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';

class LoadedCatalogPage extends StatelessWidget {
  const LoadedCatalogPage({
    super.key,
    required this.films,
    required this.onScrollEnd,
    required this.scrollController,
  });

  final List<FilmModel> films;
  final ScrollController scrollController;
  final ValueChanged<int> onScrollEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (films.isEmpty)
          const EmptyStateWidget()
        else
          Expanded(
            child: FilmGridView(
              films: films,
              onPageChanged: onScrollEnd,
              scrollController: scrollController,
            ),
          ),
      ],
    );
  }
}