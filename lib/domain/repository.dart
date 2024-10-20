import 'package:film_zone/data/models/film_model.dart';

abstract interface class Repository {
  Future<List<FilmModel>> searchFilms({
    required String query,
    required List<FilmModel> currentFilms,
    required int currentPage,
  });

  Future<void> saveFilms(List<FilmModel> films);

  Future<List<FilmModel>> getCachedFilms();

  Future<void> clearFilms();
}
