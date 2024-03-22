import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../widgets/glass/glass_layer_container.dart';
import '../../domain/entities/dashboard_navigator.dart';

class DashboardNavigation extends StatefulWidget {
  const DashboardNavigation({super.key});

  @override
  State<DashboardNavigation> createState() => _DashboardNavigationState();
}

class _DashboardNavigationState extends State<DashboardNavigation> {
  final List<DashboardNavigator> navigationItems = [
    const DashboardNavigator(id: 1, name: "Home", iconData: Icons.home_rounded),
    const DashboardNavigator(id: 2, name: "Search", iconData: Icons.search_rounded),
    const DashboardNavigator(id: 3, name: "Profile", iconData: Icons.person_rounded),
  ];
  final ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    Color iconColor = context.surfaceColor(
      light: const Color(0XFFA3A9B2),
      dark: const Color(0XFF74787E),
    );

    return GlassLayerContainer(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (context, selectedIndex, child) {
          return Row(
            children: List.generate(
              navigationItems.length,
              (index) {
                final navigationItem = navigationItems[index];
                final color = selectedIndex == index ? primaryColor : iconColor;

                return Expanded(
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      indexNotifier.value = index;
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(navigationItem.iconData, color: color, size: appBarIconSize),
                        Text(navigationItem.name, style: xSmallRegular(color))
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
