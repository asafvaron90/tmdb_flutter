import 'package:model/models.dart';

class HiveBoxes {
  static String getBoxNameByMovieType(MoviesType type) => 'movies_${type.name}';

  static String getBoxNameByTvsType(TvsType type) => 'tvs_${type.name}';
}
