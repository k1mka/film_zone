import 'package:film_zone/core/theme/palette.dart';
import 'package:film_zone/core/theme/text_styles.dart';
import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';

class PosterPreviewHandler extends StatelessWidget {
  const PosterPreviewHandler(this.filmModel, {super.key});

  final FilmModel filmModel;

  bool get isHasPoster => filmModel.posterUrl.isNotEmpty;

  static const _spacer = Spacer();
  static const _iconSize = 48.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: () {
        if (isHasPoster) {
          return ClipRRect(
            borderRadius: Tokens.borderRadius8,
            child: Image.network(
              filmModel.posterUrl,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return Padding(
            padding: Tokens.padding12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _spacer,
                const Icon(
                  size: _iconSize,
                  Icons.image_not_supported,
                  color: Palette.white,
                ),
                _spacer,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    filmModel.title,
                    style: TextStyles.posterTitleStyle,
                  ),
                ),
              ],
            ),
          );
        }
      }(),
    );
  }
}
