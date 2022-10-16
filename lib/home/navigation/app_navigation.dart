import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:movies/movies.dart';
import 'package:tmdb_flutter/home/app.dart';
import 'package:tmdb_flutter/home/navigation/page_not_found.dart';
import 'package:ui_movies/movies_page/movies_page.dart';
import 'package:ui_movies/movies_routes.dart';

import '../../service_locator.dart';
import 'nav_page.dart';

class AppNavigation {
  static final List<NavPage> pages = [
    NavPage(
      routeName: 'movies',
      title: 'Movies',
      page: MoviesPage(moviesRepository: getIt<MoviesRepository>()),
      icon: Icons.movie_creation_outlined,
      selectedIcon: Icons.movie,
    ),
    NavPage(
      routeName: 'tvs',
      title: 'TVs',
      page: const Text('Index 1: Tvs'),
      icon: Icons.tv,
      selectedIcon: Icons.tv,
    ),
    NavPage(
      routeName: 'settings',
      title: 'Settings',
      page: const Text('Index 2: Settings'),
      icon: Icons.settings_applications_outlined,
      selectedIcon: Icons.settings_applications,
    )
  ];

  static final GoRouter router = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    // use this redirect for the login state
    redirect: (state) {
      return null;
    },
    errorBuilder: (context, state) => const PageNotFound(),
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const MyHomePage(index: 0),
      ),
      MoviesRoutes().route(const MyHomePage(index: 0), const PageNotFound()),
      GoRoute(
          path: '/tvs',
          name: 'tvs',
          builder: (BuildContext context, GoRouterState state) =>
              const MyHomePage(index: 1),
          routes: [
            GoRoute(
              path: ':tId',
              builder: (context, state) {
                final tId = state.params['tId'];
                Fimber.d('tId: $tId');
                return Center(child: Text('$tId'));
              },
            )
          ]),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (BuildContext context, GoRouterState state) =>
            const MyHomePage(index: 2),
      ),
    ],
  );
}
