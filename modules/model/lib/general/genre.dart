class Genre {
  final int id;
  final String name;

  Genre(this.id, this.name);

  factory Genre.fromJson(Map<String, dynamic> json) =>
      Genre(json['id'], json['name']);

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
