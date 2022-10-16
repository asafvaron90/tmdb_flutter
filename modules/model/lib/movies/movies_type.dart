// ignore: constant_identifier_names
enum MoviesType { now_playing, top_rated, popular, upcoming }

extension MovieTypesUtil on MoviesType {
  String get displayName => this.name.toString().replaceAll("_", " ");

  static MoviesType? fromString(String type) {
    try {
      return MoviesType.values.firstWhere((e) => e.name == type);
    } catch (e) {
      return null;
    }
  }
}
