import 'package:model/models.dart';

class MoviesEndpoints {
  static String fromType(MoviesType type) => 'movie/${type.name}';
}
