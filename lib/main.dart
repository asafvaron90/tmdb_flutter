import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

import 'home/app.dart';
import 'service_locator.dart';

Future<void> main() async {
  Fimber.plantTree(DebugTree());
  WidgetsFlutterBinding.ensureInitialized();

  ErrorWidget.builder = (details) => Material(
        color: Colors.red,
        child: Center(
          child: Text(
            details.exception.toString(),
            style: const TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      );

  await setupDependencies();
  runApp(const MyApp());
}
