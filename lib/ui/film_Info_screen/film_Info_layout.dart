import 'package:film_zone/core/theme/palette.dart';
import 'package:film_zone/core/theme/text_styles.dart';
import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/ui/widgets/description_widget.dart';
import 'package:film_zone/ui/widgets/grade_widget.dart';
import 'package:film_zone/ui/widgets/poster_widget.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';

class FilmInfoLayout extends StatelessWidget {
  const FilmInfoLayout({super.key, required this.filmModel});

  final FilmModel filmModel;

  static const _spacer = Tokens.spacer12;
  static const _resizeToAvoidBottomInset = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PosterWidget(filmModel: filmModel),
              _spacer,
              Padding(
                padding: Tokens.paddingH12,
                child: Text(
                  filmModel.title,
                  style: TextStyles.filmCatalogStyle.copyWith(color: Palette.white),
                ),
              ),
              _spacer,
              DescriptionWidget(filmModel: filmModel),
              _spacer,
              Padding(
                padding: Tokens.paddingH12,
                child: ReviewWidget(grade: filmModel.voteAverage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
