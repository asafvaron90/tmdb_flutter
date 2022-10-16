import 'package:core/core.dart';
import 'package:model/general/genre.dart';

@HiveType(typeId: 1)
class GenreEntity extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  GenreEntity({required this.id, required this.name});

  factory GenreEntity.fromJson(Map<String, dynamic> json) =>
      GenreEntity(id: json['id'], name: json['name']);

  Map<dynamic, dynamic> toJson() => {'id': id, 'name': name};

  static List<GenreEntity> fromArray(dynamic json) {
    final List<GenreEntity> genres = [];
    for (var c in json) {
      genres.add(GenreEntity.fromJson(c));
    }
    return genres;
  }

  Genre toAppModel() => Genre(id, name);
}
