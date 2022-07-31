import 'package:core/core.dart';

@HiveType(typeId: 1)
class GenreEntity extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  GenreEntity(this.id, this.name);

  factory GenreEntity.fromJson(Map<String, dynamic> json) =>
      GenreEntity(json['id'], json['name']);

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
