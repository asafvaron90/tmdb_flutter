import 'package:hive/hive.dart';

import '../general/company.dart';
import '../general/genre.dart';
import 'season.dart';

@HiveType(typeId: 3)
class Tv extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String backdrop_path;
  @HiveField(2)
  final String first_air_date;
  @HiveField(3)
  final List<Genre> genres;
  @HiveField(4)
  final String homepage;
  @HiveField(5)
  final bool in_production;
  @HiveField(6)
  final String last_air_date;
  @HiveField(7)
  final String name;
  @HiveField(8)
  final String? next_episode_to_air;
  @HiveField(9)
  final List<Company> networks;
  @HiveField(10)
  final int number_of_episodes;
  @HiveField(11)
  final int number_of_seasons;
  @HiveField(12)
  final String original_language;
  @HiveField(13)
  final String original_name;
  @HiveField(14)
  final String overview;
  @HiveField(15)
  final double popularity;
  @HiveField(16)
  final String poster_path;
  @HiveField(17)
  final List<Company> production_companies;
  @HiveField(18)
  final List<Season> seasons;
  @HiveField(19)
  final String status;
  @HiveField(20)
  final String tagline;
  @HiveField(21)
  final String type;
  @HiveField(22)
  final double vote_average;
  @HiveField(23)
  final int vote_count;

  Tv(
    this.id,
    this.backdrop_path,
    this.first_air_date,
    this.genres,
    this.homepage,
    this.in_production,
    this.last_air_date,
    this.name,
    this.next_episode_to_air,
    this.networks,
    this.number_of_episodes,
    this.number_of_seasons,
    this.original_language,
    this.original_name,
    this.overview,
    this.popularity,
    this.poster_path,
    this.production_companies,
    this.seasons,
    this.status,
    this.tagline,
    this.type,
    this.vote_average,
    this.vote_count,
  );
}
