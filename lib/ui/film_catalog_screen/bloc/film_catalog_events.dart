import 'package:film_zone/data/models/film_model.dart';

sealed class FilmCatalogEvent {}

class SearchCatalogEvent extends FilmCatalogEvent {
  SearchCatalogEvent({
    required this.currentPage,
    required this.query,
    required this.currentFilms,
  });

  final String query;
  final int currentPage;
  final List<FilmModel> currentFilms;
}
