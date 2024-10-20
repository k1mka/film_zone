import 'dart:convert';
import 'package:film_zone/core/templates/context_extensions.dart';
import 'package:film_zone/core/theme/palette.dart';
import 'package:film_zone/core/theme/text_styles.dart';
import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/ui/film_Info_screen/film_Info_screen.dart';
import 'package:film_zone/ui/widgets/card_film_widget.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FilmGridView extends HookWidget {
  const FilmGridView({
    super.key,
    required this.films,
    required this.onPageChanged,
    required this.scrollController,
  });

  final List<FilmModel> films;
  final ScrollController scrollController;
  final ValueChanged<int> onPageChanged;

  static const _initialPage = 1;
  static const _crossAxisCount = 2;
  static const _scrollMin = 0.0;
  static const _childAspectRatio = 0.7;
  static const _crossAxisSpacing = 8.0;
  static const _mainAxisSpacing = 8.0;

  static const _animationDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final page = useState<int>(1);
    final scrollController = useScrollController();

    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
          page.value += _initialPage;
          onPageChanged(page.value);
        }
      }

      scrollController.addListener(onScroll);

      return () => scrollController.removeListener(onScroll);
    }, [scrollController, page]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (films.isNotEmpty)
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
            itemCount: films.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => context.r.push(
                FilmInfoScreen.routeName,
                pathParameters: {
                  FilmInfoScreen.param: jsonEncode(films[index].toJson()),
                },
              ),
              child: CardFilmWidget(filmModel: films[index]),
            ),
          ),
        ),
      ],
    );
  }
}
