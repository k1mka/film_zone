import 'package:film_zone/core/theme/palette.dart';
import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/ui/widgets/poster_preview_handler.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';

class CardFilmWidget extends StatelessWidget {
  const CardFilmWidget({super.key, required this.filmModel});

  final FilmModel filmModel;

  static const _offset = Offset(0, 1);
  static const _blurRadius = 4.0;
  static const _spreadRadius = 0.0;
  static const _colorOpacity = 0.1;
  static const _shadowOpacity = 0.8;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: Tokens.borderRadius8,
              color: Palette.grey.withOpacity(_colorOpacity),
              boxShadow: [
                BoxShadow(
                  offset: _offset,
                  blurRadius: _blurRadius,
                  spreadRadius: _spreadRadius,
                  color: Palette.grey.withOpacity(_shadowOpacity),
                ),
              ],
            ),
            child: PosterPreviewHandler(filmModel),
          ),
        ),
      ],
    );
  }
}
