import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../config/app_config.dart';
import 'themes/theme.dart';
import 'cubits/rebuild_cubit.dart';
import '../core/services/navigation/navigation_service.dart';

class CleanArchitectureSample extends StatelessWidget {
  const CleanArchitectureSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<RebuildCubit>(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          context.read<RebuildCubit>().rebuild(constraints);

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppConfigUtil.I.appTitle,
            theme: lightTheme,
            routerDelegate: NavigationUtil.I.routerDelegate,
            routeInformationParser: NavigationUtil.I.routeInformationParser,
          );
        },
      ),
    );
  }
}


// Dependency rules you must enforce
// domain (features/*/domain) must NOT import from data or presentation.
// data (features/*/data) may import domain to implement repository interfaces.
// presentation (features/*/presentation) may import domain/use-cases and core, but must NOT import feature data directly — always use repository interfaces / use-cases.
// core should not depend on feature folders.
// Enforce these with code reviews and (optionally) automated rules (see below).