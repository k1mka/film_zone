sealed class FilmCatalogState {}

class InitialCatalogState extends FilmCatalogState {}

class ErrorCatalogState extends FilmCatalogState {
  ErrorCatalogState(this.exception);

  final Object exception;
}
