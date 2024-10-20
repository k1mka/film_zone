import 'package:film_zone/data/models/film_model.dart';

sealed class FilmCatalogState {}

class InitialCatalogState extends FilmCatalogState {}

class LoadingCatalogState extends FilmCatalogState {}

class LoadedCatalogState extends FilmCatalogState {
  LoadedCatalogState(this.films);

  final List<FilmModel> films;
}

class ErrorCatalogState extends FilmCatalogState {
  ErrorCatalogState(this.exception);

  final Object exception;
}
