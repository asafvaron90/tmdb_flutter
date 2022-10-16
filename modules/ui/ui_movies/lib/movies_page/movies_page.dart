import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:model/models.dart';
import 'package:movies/movies.dart';
import 'package:ui_common/ui_common.dart';

import 'movies_page_controller.dart';

class MoviesPage extends GetView<MoviesPageController> {
  MoviesPage({Key? key, required MoviesRepository moviesRepository})
      : super(key: key) {
    Get.lazyPut(() => MoviesPageController(moviesRepository: moviesRepository));
  }

  @override
  Widget build(BuildContext context) {
    Fimber.d('build  XXXXX');
    return SizedBox.expand(
      child: Column(
        children: [
          Expanded(child: _buildMoviesList(MoviesType.top_rated)),
          Expanded(child: _buildMoviesList(MoviesType.now_playing)),
          Expanded(child: _buildMoviesList(MoviesType.popular)),
          Expanded(child: _buildMoviesList(MoviesType.upcoming)),
        ],
      ),
    );
  }

  StreamBuilder<List<Movie>> _buildMoviesList(MoviesType type) {
    return StreamBuilder<List<Movie>>(
      stream: controller.getStream(type),
      initialData: const [],
      builder: (context, snapshot) {
        Fimber.d('XXX snapshot: ${snapshot.data}');
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Column(
          children: [
            Text(
              type.displayName.capitalize!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Visibility(
                visible: snapshot.hasData && snapshot.data!.isNotEmpty,
                replacement: const SizedBox(
                  height: 100,
                  width: 100,
                  child: LinearProgressIndicator(),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => _onTap(snapshot.data![index], context),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: CachedNetworkImage(
                                    imageUrl: Movie.getImageUrl(
                                        snapshot.data![index].posterPath ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _onTap(Movie movie, BuildContext context) =>
      context.push('/movies/${movie.id}', extra: movie);
}
