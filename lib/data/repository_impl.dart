import 'package:film_zone/data/datasources/remote/network_service/network_service.dart';
import 'package:film_zone/domain/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(this.networkService);

  final NetworkService networkService;

  @override
  Future<void> testRequest() async {
    try {
      final result =
          await networkService.get('https://dog.ceo/api/breeds/image/random', headers: {});
      result.data;
    } catch (e) {
      rethrow;
    }
  }
}
