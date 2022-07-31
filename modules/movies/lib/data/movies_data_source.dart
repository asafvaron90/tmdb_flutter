import 'package:model/models.dart';

abstract class MoviesDataSource {
  Future<Map<dynamic, dynamic>> getByType(MoviesType type);
}
