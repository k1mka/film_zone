import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/ui/widgets/custom_back_button.dart';
import 'package:film_zone/ui/widgets/poster_preview_handler.dart';
import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({super.key, required this.filmModel});

  final FilmModel filmModel;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          PosterPreviewHandler(filmModel),
          const CustomBackButton(),
        ],
      );
}
