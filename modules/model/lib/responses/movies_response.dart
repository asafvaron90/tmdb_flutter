import '../movies/movie.dart';

class MoviesResponse {
  final int page;
  final List<Movie> results;
  final int total_pages;
  final int total_results;

  MoviesResponse(this.page, this.results, this.total_pages, this.total_results);
}
