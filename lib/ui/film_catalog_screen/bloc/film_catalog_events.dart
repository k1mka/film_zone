sealed class FilmCatalogEvent {}

class SearchCatalogEvent extends FilmCatalogEvent {
  SearchCatalogEvent(this.query);

  final String query;
}
