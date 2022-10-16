import 'package:core/core.dart';
import 'package:core/database/db_client.dart';
import 'package:flutter/material.dart';
import 'package:model/models.dart';
import 'package:movies/data/movies_data_source.dart';

import '../remote/movies_response.dart';
import '../entities/company/company_entity_adapter.dart';
import '../entities/genre/genre_entity_adapter.dart';
import '../entities/movie/movie_entity_adapter.dart';
import 'hive_boxes.dart';

class MoviesDb implements MoviesDataSource {
  final DbClient _dbClient;

  MoviesDb(this._dbClient) {
    /// register adapters
    Hive.registerAdapter(MovieAdapter());
    Hive.registerAdapter(GenreAdapter());
    Hive.registerAdapter(CompanyAdapter());

    debugPrint('MoviesDb, registered adapters');
  }

  @override
  Future<Map<dynamic, dynamic>> getByType(MoviesType type) async {
    try {
      final dbMovies = await _dbClient
          .getValuesFromBox(HiveBoxes.getBoxNameByMovieType(type));

      debugPrint('MoviesDb, getByType($type), dbMovies: $dbMovies');
      return dbMovies;
    } catch (e) {
      rethrow;
    }
  }

  saveMoviesResponseByType(
    MoviesType type,
    MoviesResponse moviesResponse,
  ) async {
    try {
      await _dbClient.addListToBox(
        boxName: HiveBoxes.getBoxNameByMovieType(type),
        key: moviesResponse.page,
        values: moviesResponse.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map> getMovieDetails(int mId) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }
}
