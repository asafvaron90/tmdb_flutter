import 'package:model/company.dart';
import 'package:model/genre.dart';

class Movie {
  final int id;
  final String backdrop_path;
  final bool belongs_to_collection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String poster_path;
  final List<Company> production_companies;
  final String release_date;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double vote_average;
  final int vote_count;

  Movie(
      this.id,
      this.backdrop_path,
      this.belongs_to_collection,
      this.budget,
      this.genres,
      this.homepage,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.production_companies,
      this.release_date,
      this.revenue,
      this.runtime,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count);
}
