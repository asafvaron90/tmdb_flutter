import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:model/models.dart';
import 'package:ui_common/ui_common.dart';
import 'package:ui_common/widgets/base_scaffold.dart';

import 'movie_details_controller.dart';
import 'movie_not_found_page.dart';

class MovieDetails extends GetView<MovieDetailsController> {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: controller.errorStream,
      builder: (context, snapshot) => Visibility(
        visible: !snapshot.hasData,
        replacement: const MovieNotFoundPage(),
        child: StreamBuilder<Movie>(
          stream: controller.movieStream,
          initialData: controller.movie,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              final movie = snapshot.data!;
              return BaseScaffold(
                title: movie.title,
                body: SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CachedNetworkImage(
                                imageUrl:
                                    Movie.getImageUrl(movie.posterPath ?? ''),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(movie.title),
                                Text(movie.releaseDate),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(movie.homepage),
                      Text(movie.overview),
                      Text(movie.tagline),
                    ],
                  ),
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
