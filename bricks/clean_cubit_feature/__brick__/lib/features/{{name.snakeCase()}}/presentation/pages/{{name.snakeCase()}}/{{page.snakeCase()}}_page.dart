import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/presentation/base_widgets/scaffold_widget.dart';

@RoutePage()
class {{page.pascalCase()}}Page extends StatelessWidget {
  const {{page.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}