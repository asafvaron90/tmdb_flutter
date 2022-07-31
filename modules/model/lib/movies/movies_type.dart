// ignore: constant_identifier_names
enum MoviesType { now_playing, top_rated, popular, upcoming }

extension MovieTypesUtil on MoviesType {
  String get displayName => this.name.toString().replaceAll("_", " ");
}
