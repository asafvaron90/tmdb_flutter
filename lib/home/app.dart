import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_flutter/home/navigation/app_navigation.dart';
import 'package:tmdb_flutter/splash/splash.dart';
import 'package:ui_common/ui_common.dart';

import '../service_locator.dart';
import 'navigation/mobile_bottom_navigation.dart';
import 'navigation/web_navigation_rails.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: AppNavigation.router.routeInformationParser,
      routeInformationProvider: AppNavigation.router.routeInformationProvider,
      routerDelegate: AppNavigation.router.routerDelegate,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int? index;
  const MyHomePage({Key? key, this.index}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void changeDestination(int index) {
    setState(() => _selectedIndex = index);
    // final page = AppNavigation.pages.elementAt(index);
    // context.goNamed(page.routeName);
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 10)),
      initialData: null,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 730) {
              return WebNavigationRailsScaffold(
                index: _selectedIndex,
                onChange: changeDestination,
              );
            } else {
              return MobileBottomNavigationScaffold(
                index: _selectedIndex,
                onChange: changeDestination,
              );
            }
          });
        }
        return const SplashPage();
      },
    );
  }
}
