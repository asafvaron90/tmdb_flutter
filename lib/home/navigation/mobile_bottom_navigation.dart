import 'package:flutter/material.dart';
import 'package:tmdb_flutter/home/navigation/app_navigation.dart';

class MobileBottomNavigationScaffold extends StatelessWidget {
  final int index;
  final Function(int) onChange;

  const MobileBottomNavigationScaffold({
    Key? key,
    required this.index,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppNavigation.pages[index].title)),
      body: Center(child: AppNavigation.pages[index].page),
      bottomNavigationBar: BottomNavigationBar(
        items: AppNavigation.pages
            .map((e) => BottomNavigationBarItem(
                  icon: Icon(e.icon),
                  activeIcon: Icon(e.selectedIcon),
                  label: e.title,
                ))
            .toList(),
        currentIndex: index,
        selectedItemColor: Colors.amber[800],
        onTap: onChange,
      ),
    );
  }
}
