import 'dart:async';

import 'package:common_dependencies/common_dependencies.dart';
import 'package:model/models.dart';
import 'package:movies/movies.dart';
import 'package:ui_common/ui_common.dart';

class MovieDetailsController extends GetxController {
  final MoviesRepository moviesRepository;
  late Movie? movie;
  late int? mId;

  final StreamController<bool> _errorController = StreamController.broadcast();
  final StreamController<Movie> _movieStreamController =
      StreamController.broadcast();

  Stream<Movie> get movieStream => _movieStreamController.stream;
  Stream<bool> get errorStream => _errorController.stream;

  MovieDetailsController({
    required this.moviesRepository,
    required this.movie,
    required this.mId,
  }) {
    assert(movie != null || mId != null);
    _init();
  }

  void _init() async {
    if (movie != null) {
      _movieStreamController.add(movie!);
    }

    if (mId != null) {
      try {
        movie = await moviesRepository.getMovieDetails(mId!);
        _movieStreamController.add(movie!);
      } catch (e) {
        Fimber.e('ERROR: $e');
        _errorController.add(true);
      }
    }
  }
}
