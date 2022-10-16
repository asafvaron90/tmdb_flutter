import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:model/models.dart';
import 'package:movies/data/entities/company/company_entity.dart';
import 'package:movies/data/entities/genre/genre_entity.dart';

@HiveType(typeId: 2)
class MovieEntity extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? backdrop_path;
  @HiveField(2)
  final Map<dynamic, dynamic>? belongs_to_collection;
  @HiveField(3)
  final num budget;
  @HiveField(4)
  final List<GenreEntity> genres;
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
  final String? poster_path;
  @HiveField(11)
  final List<CompanyEntity> production_companies;
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
  @HiveField(21)
  final List<dynamic> genre_ids;

  MovieEntity({
    required this.id,
    required this.backdrop_path,
    required this.belongs_to_collection,
    required this.budget,
    required this.genres,
    required this.genre_ids,
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
    required this.vote_count,
  });

  factory MovieEntity.fromJson(Map<dynamic, dynamic> json) {
    return MovieEntity(
        id: json['id'],
        backdrop_path: json['backdrop_path'],
        belongs_to_collection: json['belongs_to_collection'],
        budget: json['budget'] ?? 0,
        genre_ids: json['genre_ids'] ?? [],
        genres: GenreEntity.fromArray(json['genres'] ?? []),
        homepage: json['homepage'] ?? "",
        original_language: json['original_language'],
        original_title: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        poster_path: json['poster_path'],
        production_companies:
            CompanyEntity.fromArray(json['production_companies'] ?? []),
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'backdrop_path': backdrop_path,
        'belongs_to_collection': belongs_to_collection,
        'budget': budget,
        'genre_ids': genre_ids,
        'genres': genres,
        'homepage': homepage,
        'original_language': original_language,
        'original_title': original_title,
        'overview': overview,
        'popularity': popularity,
        'poster_path': poster_path,
        'production_companies': production_companies,
        'release_date': release_date,
        'revenue': revenue,
        'runtime': runtime,
        'status': status,
        'tagline': tagline,
        'title': title,
        'video': video,
        'vote_average': vote_average,
        'vote_count': vote_count,
      };

  static List<MovieEntity> fromArray(dynamic json) {
    // debugPrint('Movie, fromArray: $json');
    final List<MovieEntity> movies = [];
    for (var m in json) {
      movies.add(m is MovieEntity ? m : MovieEntity.fromJson(m));
    }
    return movies;
  }

  static String getImageUrl(String path) =>
      "https://image.tmdb.org/t/p/w500/$path";

  Movie toAppModel() => Movie(
        id: id,
        backdropPath: backdrop_path,
        belongsToCollection: belongs_to_collection,
        budget: budget,
        genre_ids: genre_ids,
        genres: genres.map((e) => e.toAppModel()).toList(),
        homepage: homepage,
        originalLanguage: original_language,
        originalTitle: original_title,
        overview: overview,
        popularity: popularity,
        posterPath: poster_path,
        productionCompanies:
            production_companies.map((e) => e.toAppModel()).toList(),
        releaseDate: release_date,
        revenue: revenue,
        runtime: runtime,
        status: status,
        tagline: tagline,
        title: title,
        video: video,
        voteAverage: vote_average,
        voteCount: vote_count,
      );
}
