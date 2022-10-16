class Genre {
  final int id;
  final String name;

  Genre(this.id, this.name);

  factory Genre.fromJson(Map<String, dynamic> json) =>
      Genre(json['id'], json['name']);

  Map<dynamic, dynamic> toJson() => {'id': id, 'name': name};

  static List<Genre> fromArray(dynamic json) {
    final List<Genre> genres = [];
    for (var c in json) {
      genres.add(Genre.fromJson(c));
    }
    return genres;
  }
}
