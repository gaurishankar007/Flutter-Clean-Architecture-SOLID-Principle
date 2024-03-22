import 'package:flutter/material.dart';

import '../../../../../core/extensions/int_extension.dart';
import '../../../../../injector/injector.dart';
import '../../../domain/entities/dashboard_navigator.dart';
import 'drawer_navigation_item.dart';

class DrawerNavigationContainer extends StatefulWidget {
  const DrawerNavigationContainer({super.key});

  @override
  State<DrawerNavigationContainer> createState() => _DrawerNavigationContainerState();
}

class _DrawerNavigationContainerState extends State<DrawerNavigationContainer> {
  final List<DashboardNavigator> navigationItems = [
    const DashboardNavigator(id: 1, name: "Navigation 1", iconData: Icons.route_rounded),
    const DashboardNavigator(id: 2, name: "Navigation 3", iconData: Icons.route_rounded),
    const DashboardNavigator(id: 3, name: "Navigation 3", iconData: Icons.route_rounded),
  ];
  final ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexNotifier,
      builder: (context, selectedIndex, child) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: screen.horizontalPadding,
            vertical: 15.propHeight,
          ),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: navigationItems.length,
          separatorBuilder: (_, index) => SizedBox(height: 10.propHeight),
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                indexNotifier.value = index;
              },
              child: DrawerNavigationItem(
                selected: index == selectedIndex,
                navigationItem: navigationItems[index],
              ),
            );
          },
        );
      },
    );
  }
}
