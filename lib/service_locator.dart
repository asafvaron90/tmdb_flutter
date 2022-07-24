import 'package:core/movies/data/movies_api.dart';
import 'package:core/movies/data/movies_db.dart';
import 'package:core/movies/movies_repository.dart';
import 'package:core/network/network_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(NetworkClient());
  getIt.registerSingleton(MoviesApi(getIt<NetworkClient>()));
  getIt.registerSingleton(MoviesDb());
  getIt.registerSingleton(MoviesRepository(
      moviesApi: getIt<MoviesApi>(), moviesDb: getIt<MoviesDb>()));
}
