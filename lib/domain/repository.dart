import 'package:film_zone/data/models/film_model.dart';

abstract interface class Repository {
  Future<List<FilmModel>> searchFilms(String query);
}
