import 'package:film_zone/core/env.dart';
import 'package:film_zone/core/templates/typedefs.dart';
import 'package:film_zone/data/datasources/remote/network_service/network_service.dart';
import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/domain/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(this.networkService);

  final NetworkService networkService;

  static const String _searchEndpoint = '/search/movie';
  static const _tokenTypeKey = 'Bearer';
  static const _authKey = 'Authorization';
  static const _queryKey = 'query';
  static const _resultsKey = 'results';
  static const _pageKey = 'page';

  @override
  Future<List<FilmModel>> searchFilms({
    required String query,
    required List<FilmModel> currentFilms,
    required int currentPage,
  }) async {
    try {
      final newFilms = await _getCatalog(query, currentPage);
      final updatedFilms = [...currentFilms, ...newFilms];

      return updatedFilms;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<FilmModel>> _getCatalog(String query, int currentPage) async {
    try {
      final result = await networkService.get(
        url: '${Env.baseUrl}$_searchEndpoint',
        queryParameters: {
          _queryKey: query,
          _pageKey: currentPage,
        },
        headers: {_authKey: '$_tokenTypeKey ${Env.apiKey}'},
      );

      final catalog = (result.data[_resultsKey] as List)
          .map<FilmModel>((film) => FilmModel.fromJson(film as JsonMap))
          .toList();

      return catalog;
    } catch (error) {
      rethrow;
    }
  }
}
