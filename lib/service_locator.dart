import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/data/local/movies_db.dart';
import 'package:movies/data/remote/movies_api.dart';
import 'package:movies/movies_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  /// local & remote clients (core)
  getIt.registerSingletonAsync<DbClient>(() async => DbClient().init());
  getIt.registerSingletonAsync<NetworkClient>(
      () async => NetworkClient().init());

  /// movies repository + data sources
  getIt.registerSingletonAsync(
      () async => MoviesRepository(
          moviesApi: MoviesApi(getIt<NetworkClient>()),
          moviesDb: MoviesDb(getIt<DbClient>())),
      dependsOn: [
        DbClient,
        NetworkClient,
      ]);
}
