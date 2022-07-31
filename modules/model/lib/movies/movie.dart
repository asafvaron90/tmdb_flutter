import 'package:flutter/material.dart';

import '../general/company.dart';

class Movie {
  final int id;
  final String? backdropPath;
  final bool belongsToCollection;
  final num budget;
  final List<int> genres;
  final String homepage;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final num popularity;
  final String? posterPath;
  final List<Company> productionCompanies;
  final String releaseDate;
  final num revenue;
  final num runtime;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final num voteAverage;
  final num voteCount;

  Movie({
    required this.id,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<dynamic, dynamic> json) {
    return Movie(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        belongsToCollection: json['belongs_to_collection'] ?? false,
        budget: json['budget'] ?? 0,
        genres: json['genres'] ?? [],
        homepage: json['homepage'] ?? "",
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        productionCompanies:
            Company.fromArray(json['production_companies'] ?? []),
        releaseDate: json['release_date'],
        revenue: json['revenue'] ?? 0,
        runtime: json['runtime'] ?? 0,
        status: json['status'] ?? '',
        tagline: json['tagline'] ?? '',
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'backdrop_path': backdropPath,
        'belongs_to_collection': belongsToCollection,
        'budget': budget,
        'genres': genres,
        'homepage': homepage,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'production_companies': productionCompanies,
        'release_date': releaseDate,
        'revenue': revenue,
        'runtime': runtime,
        'status': status,
        'tagline': tagline,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  static List<Movie> fromArray(dynamic json) {
    debugPrint('Movie, fromArray: $json');
    final List<Movie> movies = [];
    for (var m in json) {
      movies.add(m is Movie ? m : Movie.fromJson(m));
    }
    return movies;
  }

  static String getImageUrl(String path) =>
      "https://image.tmdb.org/t/p/w500/$path";
}
