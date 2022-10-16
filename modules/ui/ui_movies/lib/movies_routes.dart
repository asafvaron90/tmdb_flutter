import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:model/models.dart';
import 'package:movies/movies.dart';
import 'package:ui_common/base/route_creator.dart';
import 'package:ui_common/ui_common.dart';
import 'package:ui_movies/movie_by_type/movies_type_controller.dart';
import 'package:ui_movies/movie_by_type/movies_type_page.dart';

import 'movie_details/movie_details_controller.dart';
import 'movie_details/movie_details_page.dart';

class MoviesRoutes extends RouteCreator {
  @override
  GoRoute route(Widget home, Widget error) => GoRoute(
        path: '/movies',
        name: 'movies',
        builder: (BuildContext context, GoRouterState state) => home,
        routes: [
          GoRoute(
            path: ':mId',
            builder: (context, state) {
              Fimber.d('state.extra: ${state.extra}');
              Fimber.d('state.params: ${state.params}');
              Fimber.d('state.path: ${state.path}');

              MoviesType? type =
                  MovieTypesUtil.fromString(state.params['mId'] ?? '');
              Fimber.d('type: $type');
              if (type != null) {
                Get.lazyReplace(() => MoviesTypeController(
                      type: type,
                      moviesRepository: GetIt.instance.get<MoviesRepository>(),
                    ));

                return MoviesTypePage();
              }

              final movie = state.extra as Movie?;
              final mId = int.tryParse(state.params['mId'] ?? '');
              if (movie == null && mId == null) {
                return error;
              }

              Get.lazyReplace(() => MovieDetailsController(
                  moviesRepository: GetIt.instance.get<MoviesRepository>(),
                  movie: movie,
                  mId: mId));

              return const MovieDetails();
            },
          ),
        ],
      );
}
