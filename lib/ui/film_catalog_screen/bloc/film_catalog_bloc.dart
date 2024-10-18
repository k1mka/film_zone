import 'package:film_zone/domain/repository.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_events.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmCatalogBloc extends Bloc<FilmCatalogEvent, FilmCatalogState> {
  FilmCatalogBloc(this.repository) : super(InitialCatalogState()) {
    on<InitialCatalogEvent>((event, emit) async {
      try {
        emit(InitialCatalogState());
        repository.testRequest();
      } catch (e) {
        emit(ErrorCatalogState(e));
      }
    });
  }

  final Repository repository;
}
