import 'package:common_dependencies/common_dependencies.dart';
import 'package:model/models.dart';
import 'package:movies/movies.dart';

class MoviesController extends GetxController {
  final MoviesRepository moviesRepository;

  MoviesController({required this.moviesRepository});

  // List<Movie> moviesTopRated = [].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMovies();
  }

  void _loadMovies() {
    getByType(MoviesType.top_rated);
  }

  Stream<List<Movie>> getByType(MoviesType type) async* {
    final movies = await moviesRepository.getByType(type);
    yield movies;
  }
}
