import 'package:model/movies/movie.dart';
import 'package:model/movies/movies_type.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getByType(MoviesType type);
}
