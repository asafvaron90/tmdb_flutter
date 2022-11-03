import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:movies/data/local/movies_db.dart';
import 'package:movies/data/remote/movies_api.dart';
import 'package:movies/movies_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
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

  await getIt.allReady();

  Fimber.d('DI complete');
}
