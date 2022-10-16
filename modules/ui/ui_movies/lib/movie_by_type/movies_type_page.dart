import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:model/models.dart';
import 'package:ui_common/ui_common.dart';

import 'movies_type_controller.dart';

class MoviesTypePage extends GetView<MoviesTypeController> {
  const MoviesTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Fimber.d('build  XXXXX');
    return BaseScaffold(
      title: controller.type.displayName.capitalize!,
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        child: Expanded(
          child: _buildMoviesList(),
        ),
      ),
    );
  }

  Widget _buildMoviesList() {
    return StreamBuilder<List<Movie>>(
      stream: controller.moviesStream,
      initialData: const [],
      builder: (context, snapshot) {
        Fimber.d('XXX snapshot: ${snapshot.data}');
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Visibility(
          visible: snapshot.hasData && snapshot.data!.isNotEmpty,
          replacement: const SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => _onTap(snapshot.data![index], context),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Row(
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
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Expanded(
                                child: Text(snapshot.data![index].title),
                              ),
                              Expanded(
                                child: Text(
                                    '${snapshot.data![index].voteAverage}'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onTap(Movie movie, BuildContext context) =>
      context.push('/movies/${movie.id}', extra: movie);
}
