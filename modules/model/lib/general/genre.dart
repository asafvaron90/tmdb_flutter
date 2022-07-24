import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Genre extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  Genre(this.id, this.name);

  factory Genre.fromJson(Map<String, dynamic> json) =>
      Genre(json['id'], json['name']);
}
