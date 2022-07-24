import 'package:model/movies/movies_type.dart';

class MoviesEndpoints {
  MoviesEndpoints._();

  static const String popular = "movie/popular";
  static const String topRated = "movie/top_rated";
  static const String nowPlaying = "movie/now_playing";
  static const String upcoming = "movie/upcoming";

  static String getEndpointByType(MoviesType type) {
    switch (type) {
      case MoviesType.nowPlaying:
        return MoviesEndpoints.nowPlaying;
      case MoviesType.topRated:
        return MoviesEndpoints.topRated;
      case MoviesType.popular:
        return MoviesEndpoints.popular;
      case MoviesType.upcoming:
        return MoviesEndpoints.upcoming;
    }
  }
}
