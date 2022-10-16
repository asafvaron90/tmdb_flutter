import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

import 'home/app.dart';
import 'service_locator.dart';

Future<void> main() async {
  Fimber.plantTree(DebugTree());
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();
  runApp(const MyApp());
}
