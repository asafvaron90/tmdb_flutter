import 'package:hive/hive.dart';

@HiveType(typeId: 4)
class Season extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String air_date;
  @HiveField(2)
  final int episode_count;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String overview;
  @HiveField(5)
  final String poster_path;
  @HiveField(6)
  final int season_number;

  Season(
    this.air_date,
    this.episode_count,
    this.id,
    this.name,
    this.overview,
    this.poster_path,
    this.season_number,
  );
}
