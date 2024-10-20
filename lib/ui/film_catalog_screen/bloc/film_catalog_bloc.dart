import 'dart:async';
import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/data/models/page_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:film_zone/domain/repository.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_events.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_states.dart';
import 'package:rxdart/rxdart.dart';

class FilmCatalogBloc extends Bloc<FilmCatalogEvent, FilmCatalogState> {
  FilmCatalogBloc(this.repository) : super(InitialCatalogState()) {
    const debounceDuration = Duration(milliseconds: 400);

    on<SearchCatalogEvent>(
      _onSearchEvent,
      transformer: debounce(debounceDuration),
    );

    on<LoadCachedCatalogEvent>(_onLoadCachedCatalogEvent);

    add(LoadCachedCatalogEvent());
  }

  final Repository repository;

  Future<void> _onSearchEvent(
    SearchCatalogEvent event,
    Emitter<FilmCatalogState> emit,
  ) async {
    if (event.query.length < 2) {
      return;
    }
    try {
      final results = await repository.searchFilms(
        query: event.query,
        currentFilms: event.currentFilms,
        currentPage: event.currentPage,
      );

      emit(LoadedCatalogState(results));
      await repository.saveFilms(results.films);
    } catch (error) {
      emit(ErrorCatalogState(error));
    }
  }

  Future<void> _onLoadCachedCatalogEvent(
    LoadCachedCatalogEvent event,
    Emitter<FilmCatalogState> emit,
  ) async {
    const defaultV = 1;
    final cachedResults = await repository.getCachedFilms();

    if (cachedResults.isNotEmpty) {
      final limitedResults = _limitResults(cachedResults);
      emit(
        LoadedCachedState(
          PageModel(
            totalPages: defaultV,
            currentPage: defaultV,
            films: [...limitedResults],
          ),
        ),
      );
    }
  }

  // TODO(George): get last 100 films
  List<FilmModel> _limitResults(List<FilmModel> results) {
    const max = 100;

    if (results.length <= max) {
      return results;
    } else {
      return results.sublist(results.length - max);
    }
  }

  EventTransformer<T> debounce<T>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}
