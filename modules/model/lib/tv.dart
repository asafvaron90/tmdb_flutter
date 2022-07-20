import 'company.dart';
import 'genre.dart';
import 'season.dart';

class Tv {
  final int id;
  final String backdrop_path;
  final String first_air_date;
  final List<Genre> genres;
  final String homepage;
  final bool in_production;
  final String last_air_date;
  final String name;
  final String? next_episode_to_air;
  final List<Company> networks;
  final int number_of_episodes;
  final int number_of_seasons;
  final String original_language;
  final String original_name;
  final String overview;
  final double popularity;
  final String poster_path;
  final List<Company> production_companies;
  final List<Season> seasons;
  final String status;
  final String tagline;
  final String type;
  final double vote_average;
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
