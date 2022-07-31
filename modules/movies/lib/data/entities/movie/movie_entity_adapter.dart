import 'package:core/core.dart';

import 'movie_entity.dart';

class MovieAdapter extends TypeAdapter<MovieEntity> {
  @override
  final typeId = 2;

  @override
  MovieEntity read(BinaryReader reader) => MovieEntity.fromJson(reader.read());

  @override
  void write(BinaryWriter writer, MovieEntity obj) =>
      writer.write(obj.toJson());
}
