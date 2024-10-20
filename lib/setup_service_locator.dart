import 'package:dio/dio.dart';
import 'package:film_zone/core/logger/composite_logger.dart';
import 'package:film_zone/core/logger/composite_logger_impl.dart';
import 'package:film_zone/core/router/app_router.dart';
import 'package:film_zone/core/router/go_router.dart';
import 'package:film_zone/data/datasources/locale/local_storage.dart';
import 'package:film_zone/data/datasources/locale/local_storage_sqlflite_impl.dart';
import 'package:film_zone/data/datasources/remote/network_service/network_service.dart';
import 'package:film_zone/data/datasources/remote/network_service/network_service_impl.dart';
import 'package:film_zone/data/repository_impl.dart';
import 'package:film_zone/domain/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final _getIt = GetIt.instance;

final getLogger = _getIt<CompositeLogger>();
final getRouter = _getIt<AppRouter>();
final getRepo = _getIt<Repository>();

Future<void> serviceLocator() async => setupSync();

void setupSync() {
  _getIt.registerLazySingleton<NetworkService>(() => DioNetworkServiceImpl(Dio()));
  _getIt.registerLazySingleton<LocalStorage>(() => LocalStorageSQLFliteImpl());
  _getIt.registerLazySingleton<AppRouter>(() => GoAppRouter());
  _getIt.registerSingleton<CompositeLogger>(CompositeLoggerImpl(logger: Logger()));
  _getIt.registerSingleton<Repository>(
    RepositoryImpl(
      _getIt<NetworkService>(),
      _getIt<LocalStorage>(),
    ),
  );
}
