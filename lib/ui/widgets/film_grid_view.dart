import 'dart:convert';
import 'package:film_zone/core/templates/context_extensions.dart';
import 'package:film_zone/core/theme/palette.dart';
import 'package:film_zone/core/theme/text_styles.dart';
import 'package:film_zone/data/models/page_model.dart';
import 'package:film_zone/ui/film_Info_screen/film_Info_screen.dart';
import 'package:film_zone/ui/widgets/card_film_widget.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FilmGridView extends HookWidget {
  const FilmGridView({
    super.key,
    required this.page,
    required this.onPageChanged,
    required this.scrollController,
    required this.searchQuery,
  });

  final PageModel page;
  final String searchQuery;
  final ScrollController scrollController;
  final ValueChanged<int> onPageChanged;

  static const _initialPage = 1;
  static const _crossAxisCount = 2;
  static const _childAspectRatio = 0.7;
  static const _crossAxisSpacing = 8.0;
  static const _mainAxisSpacing = 8.0;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    final films = page.films;

    final filteredFilms = films.where((film) {
      return film.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >= scrollController.position.maxScrollExtent &&
            page.currentPage < page.totalPages) {
          final nextPage = page.currentPage + 1;
          onPageChanged(nextPage);
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]); // Убрали page.currentPage из зависимостей

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (filteredFilms.isNotEmpty)
          Padding(
            padding: Tokens.padding12,
            child: Text(
              context.s.film_catalog,
              style: TextStyles.filmCatalogStyle.copyWith(color: Palette.white),
            ),
          ),
        Expanded(
          child: GridView.builder(
            controller: scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount,
              childAspectRatio: _childAspectRatio,
              crossAxisSpacing: _crossAxisSpacing,
              mainAxisSpacing: _mainAxisSpacing,
            ),
            padding: Tokens.padding8,
            itemCount: filteredFilms.length,
            itemBuilder: (context, index) {
              final film = filteredFilms[index];
              return GestureDetector(
                onTap: () => context.r.push(
                  FilmInfoScreen.routeName,
                  pathParameters: {
                    FilmInfoScreen.param: jsonEncode(film.toJson()),
                  },
                ),
                child: CardFilmWidget(filmModel: film),
              );
            },
          ),
        ),
      ],
    );
  }
}
