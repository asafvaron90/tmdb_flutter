import 'package:core/core.dart';

import 'genre_entity.dart';

class GenreAdapter extends TypeAdapter<GenreEntity> {
  @override
  final typeId = 1;

  @override
  GenreEntity read(BinaryReader reader) {
    return GenreEntity.fromJson(reader.read());
  }

  @override
  void write(BinaryWriter writer, GenreEntity obj) {
    writer.write(obj.toJson());
  }
}
