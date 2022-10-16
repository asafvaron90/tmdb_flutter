import 'package:model/models.dart';

abstract class MoviesDataSource {
  Future<Map<dynamic, dynamic>> getByType(MoviesType type);
  Future<Map<dynamic, dynamic>> getMovieDetails(int mId);
}
