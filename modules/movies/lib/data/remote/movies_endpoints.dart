import 'package:model/models.dart';

class MoviesEndpoints {
  static String fromType(MoviesType type) => 'movie/${type.name}';
  static String byId(int mId) => 'movie/$mId';
}
