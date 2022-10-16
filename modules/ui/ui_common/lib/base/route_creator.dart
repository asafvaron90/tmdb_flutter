import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

abstract class RouteCreator {
  GoRoute route(Widget home, Widget error);
}
