import 'package:common_dependencies/common_dependencies.dart';
import 'package:model/models.dart';
import 'package:movies/movies_repository.dart';
import 'package:ui_common/ui_common.dart';

class MoviesTypeController extends GetxController {
  final MoviesRepository moviesRepository;
  final MoviesType type;
  final List<Movie> _movies = [];
  final _moviesSubject = BehaviorSubject<List<Movie>>.seeded([]);
  var _page = 1;

  final refreshController = RefreshController();

  Stream<List<Movie>> get moviesStream => _moviesSubject.stream;

  MoviesTypeController({required this.type, required this.moviesRepository});

  @override
  void onInit() {
    _getMovies();
    super.onInit();
  }

  _getMovies() async {
    try {
      final movies = await moviesRepository.getByType(type, page: _page);
      _movies.addAll(movies);
      _moviesSubject.add(_movies);
    } catch (e) {
      Fimber.e('ERROR: $e');
    }
  }

  onRefresh() async {
    _page = 1;
    _movies.clear();
    _moviesSubject.add(_movies);
    Fimber.d('refreshing...');
    await _getMovies();
    refreshController.refreshCompleted();
  }
}
