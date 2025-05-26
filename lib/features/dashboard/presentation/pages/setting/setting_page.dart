import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/services/session/session_service.dart';
import '../../../../../core/utils/ui_helpers.dart';
import '../../../../app/presentation/base_widgets/action/primary_button_widget.dart';
import '../../../../app/presentation/base_widgets/scaffold_widget.dart';
import '../../cubits/dashboard/dashboard_cubit.dart';
import 'widgets/blue_container_widget.dart';
import 'widgets/setting_items_widget.dart';

@RoutePage()
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      onPopInvokedWithResult: () => context.read<DashboardCubit>().setIndex(0),
      isScrollable: false,
      usePadding: false,
      body: Stack(
        children: [
          const BlueContainerWidget(),
          Padding(
            padding: UIHelpers.screenLR(top: 130, bottom: 12),
            child: Column(
              children: [
                const SettingItemsWidget(),
                const Spacer(),
                PrimaryButtonWidget(
                  onTap: SessionUtil.I.clearSessionData,
                  text: "Logout",
                  color: AppColors.error,
                  expandWidth: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
