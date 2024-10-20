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

  @override
  Future<List<FilmModel>> searchFilms(String query) async {
    try {
      final result = await networkService.get(
        url: '${Env.baseUrl}$_searchEndpoint',
        queryParameters: {_queryKey: query},
        headers: {_authKey: '$_tokenTypeKey ${Env.apiKey}'},
      );

      final response = result.data[_resultsKey];

      final films = response.map<FilmModel>((film) => FilmModel.fromJson(film as JsonMap)).toList();

      return films;
    } catch (error) {
      rethrow;
    }
  }
}
