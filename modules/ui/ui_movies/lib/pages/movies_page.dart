import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:model/models.dart';
import 'package:movies/movies.dart';
import 'package:ui_movies/movies_controller.dart';

class MoviesPage extends GetView<MoviesController> {
  MoviesPage({Key? key, required MoviesRepository moviesRepository})
      : super(key: key) {
    Get.lazyPut(() => MoviesController(moviesRepository: moviesRepository));
  }

  @override
  Widget build(BuildContext context) {
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
      stream: controller.getByType(type),
      initialData: const [],
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Column(
          children: [
            Text(type.displayName.capitalize!),
            Expanded(
              child: Visibility(
                visible: snapshot.hasData && snapshot.data!.isNotEmpty,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 100,
                        height: 220,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CachedNetworkImage(
                                  imageUrl: Movie.getImageUrl(
                                      snapshot.data![index].posterPath ?? ''),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data![index].title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Text(
                                      //   snapshot.data![index].overview,
                                      //   maxLines: 3,
                                      //   overflow: TextOverflow.ellipsis,
                                      //   style: const TextStyle(
                                      //     fontSize: 14,
                                      //   ),
                                      // ),
                                    ]),
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
          ],
        );
      },
    );
  }
}
