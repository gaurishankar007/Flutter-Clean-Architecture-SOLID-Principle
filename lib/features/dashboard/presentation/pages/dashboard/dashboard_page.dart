import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/services/message/toast_message_service.dart';
import '../../../../../core/services/navigation/navigation_service.dart';
import '../../../../../core/utils/screen_util/screen_util.dart';
import '../../cubits/dashboard/dashboard_cubit.dart';
import 'widgets/bottom_navigation_widget.dart';

@RoutePage(name: DASHBOARD_ROUTE)
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    ToastMessageUtil.I.setContext(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<DashboardCubit>()..initialize(),
        ),
      ],
      child: Container(
        color: AppColor.surface,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: ScreenUtil.I.bottomNavigationHeight,
              ),
              child: const AutoRouter(),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
