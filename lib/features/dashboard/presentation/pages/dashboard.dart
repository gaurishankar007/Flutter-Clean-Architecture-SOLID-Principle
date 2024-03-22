import 'package:auto_route/auto_route.dart';
import '../widgets/dashboard_app_bar.dart';
import '../../../../widgets/preferred_size_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_drawer/flutter_sliding_drawer.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../widgets/sliding_drawer.dart';
import '../inheritedWidget/drawer_key_inherited_widget.dart';
import '../widgets/dashboard_navigation.dart';
import 'drawer_content.dart';

@RoutePage(name: DASHBOARD_ROUTE)
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<SlidingDrawerState> drawerKey = GlobalKey<SlidingDrawerState>();

  @override
  Widget build(BuildContext context) {
    return DrawerKeyInheritedWidget(
      drawerKey: drawerKey,
      child: SlidingDrawerWidget(
        drawerKey: drawerKey,
        drawer: const DrawerContent(),
        content: Scaffold(
          appBar: PreferredSizeAppBar(
            appBar: DashboardAppBar(title: "Clean Architecture"),
          ),
          body: Column(),
          bottomNavigationBar: DashboardNavigation(),
        ),
      ),
    );
  }
}
