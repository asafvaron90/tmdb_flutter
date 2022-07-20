class Season {
  final int id;
  final String air_date;
  final int episode_count;
  final String name;
  final String overview;
  final String poster_path;
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
