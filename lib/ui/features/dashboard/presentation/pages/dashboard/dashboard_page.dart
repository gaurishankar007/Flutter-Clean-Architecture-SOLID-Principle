import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../cubits/dashboard/dashboard_cubit.dart';
import 'widgets/base_bottom_navigation.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<DashboardCubit>()..initialize(),
        ),
      ],
      child: Container(
        color: AppColors.surface,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: const AutoRouter(),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BaseBottomNavigation(),
            ),
          ],
        ),
      ),
    );
  }
}
