import 'package:core/movies/data/movies_data_source.dart';
import 'package:core/movies/data/movies_db.dart';
import 'package:core/movies/data/movies_api.dart';
import 'package:dio/dio.dart';
import 'package:model/movies/movies_type.dart';
import 'package:model/movies/movie.dart';

import '../network/network_exceptions.dart';

class MoviesRepository extends MoviesDataSource {
  final MoviesApi moviesApi;
  final MoviesDb moviesDb;

  MoviesRepository({required this.moviesApi, required this.moviesDb});

  @override
  Future<List<Movie>> getByType(MoviesType type) async {
    try {
      final response = await moviesApi.getByType(type);
      return Movie.fromMoviesResponse(response.data);
    } on DioError catch (e) {
      final errorMessage = NetworkExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
