class Season {
  final int id;
  final String air_date;
  final int episode_count;
  final String name;
  final String overview;
  final String poster_path;
  final int season_number;

  Season({
    required this.air_date,
    required this.episode_count,
    required this.id,
    required this.name,
    required this.overview,
    required this.poster_path,
    required this.season_number,
  });

  factory Season.fromJson(Map<dynamic, dynamic> json) => Season(
        air_date: json['air_date'],
        episode_count: json['episode_count'],
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        poster_path: json['poster_path'],
        season_number: json['season_number'],
      );

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        'air_date': air_date,
        'episode_count': episode_count,
        'name': name,
        'overview': overview,
        'poster_path': poster_path,
        'season_number': season_number,
      };
}
