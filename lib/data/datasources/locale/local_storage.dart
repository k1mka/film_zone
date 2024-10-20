import 'package:film_zone/data/models/film_model.dart';

abstract interface class LocalStorage {
  Future<void> saveFilms(List<FilmModel> films);

  Future<void> clearFilms();

  Future<List<FilmModel>> getCachedFilms();
}
