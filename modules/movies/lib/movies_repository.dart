import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:model/models.dart';

import 'data/local/movies_db.dart';
import 'data/remote/movies_api.dart';
import 'data/remote/movies_response.dart';

class MoviesRepository {
  final MoviesApi moviesApi;
  final MoviesDb moviesDb;

  List<Movie> movies = [];
  MoviesRepository({required this.moviesApi, required this.moviesDb});

  Future<List<Movie>> getByType(MoviesType type, {int page = 1}) async {
    movies.clear();
    try {
      /// get moviesResponse from local
      var mDbs = await moviesDb.getByType(type);
      if (mDbs.isNotEmpty) {
        movies.addAll(MoviesResponse.fromJson(mDbs[page])
            .results
            .map((e) => e.toAppModel())
            .toList());
      }

      /// remote call
      final response = await moviesApi.getByType(type);
      final moviesResponse = MoviesResponse.fromJson(response);

      /// save remote
      await moviesDb.saveMoviesResponseByType(type, moviesResponse);

      return moviesResponse.results.map((e) => e.toAppModel()).toList();
    } on DioError catch (e) {
      final errorMessage = NetworkExceptions.fromDioError(e).toString();
      debugPrint('errorMessage: $errorMessage');
      return movies;
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  Future<Movie> getMovieDetails(int mId) async {
    // TODO add local db

    try {
      final movieRes = await moviesApi.getMovieDetails(mId);
      final movie = Movie.fromJson(movieRes);
      return movie;
    } on DioError catch (e) {
      final errorMessage = NetworkExceptions.fromDioError(e).toString();
      debugPrint('errorMessage: $errorMessage');
      throw errorMessage;
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
