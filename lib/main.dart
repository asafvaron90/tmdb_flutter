import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:movies/movies_repository.dart';
import 'package:tmdb_flutter/service_locator.dart';
import 'package:ui_movies/pages/movies_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
            future: getIt.allReady(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MoviesPage(moviesRepository: getIt<MoviesRepository>());
              }

              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
