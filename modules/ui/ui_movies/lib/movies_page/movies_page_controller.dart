import 'dart:async';

import 'package:common_dependencies/common_dependencies.dart';
import 'package:model/models.dart';
import 'package:movies/movies.dart';
import 'package:ui_common/ui_common.dart';

class MoviesPageController extends GetxController {
  final MoviesRepository moviesRepository;

  final _topRatedSubject = BehaviorSubject<List<Movie>>.seeded([]);
  final _upcomingSubject = BehaviorSubject<List<Movie>>.seeded([]);
  final _popularSubject = BehaviorSubject<List<Movie>>.seeded([]);
  final _nowPlayingSubject = BehaviorSubject<List<Movie>>.seeded([]);

  MoviesPageController({required this.moviesRepository});

  Future<List<Movie>> _getByType(MoviesType type) async {
    final movies = await moviesRepository.getByType(type);
    return movies;
  }

  @override
  void onInit() {
    Fimber.d('XXX');
    _init();
    super.onInit();
  }

  @override
  void dispose() {
    Fimber.d('XXXXX');
    super.dispose();
  }

  void _init() async {
    _topRatedSubject.add(await _getByType(MoviesType.top_rated));
    _upcomingSubject.add(await _getByType(MoviesType.upcoming));
    _popularSubject.add(await _getByType(MoviesType.popular));
    _nowPlayingSubject.add(await _getByType(MoviesType.now_playing));
  }

  Stream<List<Movie>> getStream(MoviesType type) {
    switch (type) {
      case MoviesType.now_playing:
        return _nowPlayingSubject.stream;
      case MoviesType.top_rated:
        return _topRatedSubject.stream;
      case MoviesType.popular:
        return _popularSubject.stream;
      case MoviesType.upcoming:
        return _upcomingSubject.stream;
    }
  }
}
