import 'package:film_zone/data/models/page_model.dart';

sealed class FilmCatalogState {}

class InitialCatalogState extends FilmCatalogState {}

class LoadedCatalogState extends FilmCatalogState {
  LoadedCatalogState(this.page);

  final PageModel page;
}

class LoadedCachedState extends FilmCatalogState {
  LoadedCachedState(this.page);

  final PageModel page;
}

class ErrorCatalogState extends FilmCatalogState {
  ErrorCatalogState(this.exception);

  final Object exception;
}
