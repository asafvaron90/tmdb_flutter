import 'package:hive/hive.dart';

import '../general/company.dart';

@HiveType(typeId: 2)
class Movie extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String backdrop_path;
  @HiveField(2)
  final bool belongs_to_collection;
  @HiveField(3)
  final num budget;
  @HiveField(4)
  final List<int> genres;
  @HiveField(5)
  final String homepage;
  @HiveField(6)
  final String original_language;
  @HiveField(7)
  final String original_title;
  @HiveField(8)
  final String overview;
  @HiveField(9)
  final num popularity;
  @HiveField(10)
  final String poster_path;
  @HiveField(11)
  final List<Company> production_companies;
  @HiveField(12)
  final String release_date;
  @HiveField(13)
  final num revenue;
  @HiveField(14)
  final num runtime;
  @HiveField(15)
  final String status;
  @HiveField(16)
  final String tagline;
  @HiveField(17)
  final String title;
  @HiveField(18)
  final bool video;
  @HiveField(19)
  final num vote_average;
  @HiveField(20)
  final num vote_count;

  Movie(
      {required this.id,
      required this.backdrop_path,
      required this.belongs_to_collection,
      required this.budget,
      required this.genres,
      required this.homepage,
      required this.original_language,
      required this.original_title,
      required this.overview,
      required this.popularity,
      required this.poster_path,
      required this.production_companies,
      required this.release_date,
      required this.revenue,
      required this.runtime,
      required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.vote_average,
      required this.vote_count});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        backdrop_path: _getImageUrl(json['backdrop_path']),
        belongs_to_collection: json['belongs_to_collection'] ?? false,
        budget: json['budget'] ?? 0,
        genres: json['genres'] ?? [],
        homepage: json['homepage'] ?? "",
        original_language: json['original_language'],
        original_title: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        poster_path: _getImageUrl(json['poster_path']),
        production_companies: json['production_companies'] ?? [],
        release_date: json['release_date'],
        revenue: json['revenue'] ?? 0,
        runtime: json['runtime'] ?? 0,
        status: json['status'] ?? '',
        tagline: json['tagline'] ?? '',
        title: json['title'],
        video: json['video'],
        vote_average: json['vote_average'],
        vote_count: json['vote_count']);
  }

  static Future<List<Movie>> fromMoviesResponse(
      Map<String, dynamic> json) async {
    final List<Movie> movies = [];
    for (var m in json['results']) {
      movies.add(Movie.fromJson(m));
    }
    return movies;
  }

  static String _getImageUrl(String path) =>
      "https://image.tmdb.org/t/p/w500/$path";
}
