import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/services/session/session_service.dart';
import '../../../../../shared_ui/utils/ui_helpers.dart';
import '../../../../../shared_ui/ui/base/base_scaffold.dart';
import '../../../../../shared_ui/ui/base/buttons/primary_button.dart';
import '../../cubits/dashboard/dashboard_cubit.dart';
import 'widgets/blue_container.dart';
import 'widgets/setting_items.dart';

@RoutePage()
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      onPopInvokedWithResult: () => context.read<DashboardCubit>().setIndex(0),
      isScrollable: false,
      usePadding: false,
      body: Stack(
        children: [
          const BlueContainer(),
          Padding(
            padding: UIHelpers.paddingTB(top: 130, bottom: 12),
            child: Column(
              children: [
                const SettingItems(),
                const Spacer(),
                PrimaryButton(
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
