import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/ui/film_Info_screen/film_Info_layout.dart';
import 'package:flutter/material.dart';

class FilmInfoScreen extends StatelessWidget {
  const FilmInfoScreen({super.key, required this.filmModel});

  final FilmModel filmModel;

  static const param = 'film_model';
  static const routeName = 'FilmInfoScreen';

  @override
  Widget build(BuildContext context) => FilmInfoLayout(filmModel: filmModel);
}
