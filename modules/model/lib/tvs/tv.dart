import '../general/company.dart';
import '../general/genre.dart';
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

  Tv({
    required this.id,
    required this.backdrop_path,
    required this.first_air_date,
    required this.genres,
    required this.homepage,
    required this.in_production,
    required this.last_air_date,
    required this.name,
    required this.next_episode_to_air,
    required this.networks,
    required this.number_of_episodes,
    required this.number_of_seasons,
    required this.original_language,
    required this.original_name,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.production_companies,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.vote_average,
    required this.vote_count,
  });

  factory Tv.fromJson(Map<dynamic, dynamic> json) => Tv(
        id: json['id'],
        backdrop_path: json['backdrop_path'],
        first_air_date: json['first_air_date'],
        genres: json['genres'],
        homepage: json['homepage'],
        in_production: json['in_production'],
        last_air_date: json['last_air_date'],
        name: json['name'],
        next_episode_to_air: json['next_episode_to_air'],
        networks: Company.fromArray(json['networks'] ?? []),
        number_of_episodes: json['number_of_episodes'],
        number_of_seasons: json['number_of_seasons'],
        original_language: json['original_language'],
        original_name: json['original_name'],
        overview: json['overview'],
        popularity: json['popularity'],
        poster_path: json['poster_path'],
        production_companies:
            Company.fromArray(json['production_companies'] ?? []),
        seasons: json['seasons'],
        status: json['status'],
        tagline: json['tagline'],
        type: json['type'],
        vote_average: json['vote_average'],
        vote_count: json['vote_count'],
      );

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        'backdrop_path': backdrop_path,
        'first_air_date': first_air_date,
        'genres': genres,
        'homepage': homepage,
        'in_production': in_production,
        'last_air_date': last_air_date,
        'name': name,
        'next_episode_to_air': next_episode_to_air,
        'networks': networks,
        'number_of_episodes': number_of_episodes,
        'number_of_seasons': number_of_seasons,
        'original_language': original_language,
        'original_name': original_name,
        'overview': overview,
        'popularity': popularity,
        'poster_path': poster_path,
        'production_companies': production_companies,
        'seasons': seasons,
        'status': status,
        'tagline': tagline,
        'type': type,
        'vote_average': vote_average,
        'vote_count': vote_count,
      };

  static List<Tv> fromArray(dynamic json) {
    final List<Tv> tvs = [];
    for (var tv in json) {
      tvs.add(Tv.fromJson(tv));
    }
    return tvs;
  }
}
