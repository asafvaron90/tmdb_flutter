import 'package:flutter/material.dart';
import 'package:tmdb_flutter/home/navigation/app_navigation.dart';

class WebNavigationRailsScaffold extends StatelessWidget {
  final int index;
  final Function(int) onChange;

  const WebNavigationRailsScaffold({
    Key? key,
    required this.index,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: index,
            onDestinationSelected: onChange,
            //minWidth: 100,
            labelType: NavigationRailLabelType.all,
            //selectedIconTheme: const IconThemeData(color: Colors.white),
            //selectedLabelTextStyle: TextStyle(color: Colors.lightBlue[500]),
            //unselectedLabelTextStyle: TextStyle(color: Colors.grey[500]),
            //elevation: 5,
            //useIndicator: true,
            //backgroundColor: Colors.grey[50],
            //indicatorColor: Colors.cyan[50],
            //leading: const MyLeadingWidget(),
            //trailing: const MyTrailingWidget(),
            destinations: AppNavigation.pages
                .map((e) => NavigationRailDestination(
                      icon: Icon(e.icon),
                      selectedIcon: Icon(e.selectedIcon),
                      label: Text(e.title),
                    ))
                .toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child: AppNavigation.pages[index].page,
            ),
          )
        ],
      ),
    );
  }
}
