import 'package:flutter/material.dart';

class NavPage {
  final String title;
  final Widget page;
  final IconData icon;
  final IconData selectedIcon;
  final String routeName;

  NavPage({
    required this.routeName,
    required this.title,
    required this.page,
    required this.icon,
    required this.selectedIcon,
  });
}
