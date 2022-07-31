import 'package:movies/data/entities/movie/movie_entity.dart';

class MoviesResponse {
  final int page;
  final List<MovieEntity> results;
  final int total_pages;
  final int total_results;

  MoviesResponse({
    required this.page,
    required this.results,
    required this.total_pages,
    required this.total_results,
  });

  factory MoviesResponse.fromJson(Map<dynamic, dynamic> json) => MoviesResponse(
        page: json['page'],
        results: json['results'] is List<MovieEntity>
            ? json['results']
            : MovieEntity.fromArray(json['results']),
        total_pages: json['total_pages'],
        total_results: json['total_results'],
      );

  Map<dynamic, dynamic> toJson() => {
        'page': page,
        'results': results,
        'total_pages': total_pages,
        'total_results': total_results,
      };
}
