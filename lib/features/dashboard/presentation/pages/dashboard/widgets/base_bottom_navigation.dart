import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../core/utils/ui_helpers.dart';
import '../../../../../../shared/widgets/base/buttons/base_icon_button.dart';
import '../../../cubits/dashboard/dashboard_cubit.dart';

class BaseBottomNavigation extends StatelessWidget {
  const BaseBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      AppIcons.home,
      AppIcons.setting,
    ];

    return Container(
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: UIHelpers.sMediumTRadius,
        boxShadow: const [
          BoxShadow(
            color: AppColors.black10,
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        buildWhen: (previous, current) =>
            previous.activeIndex != current.activeIndex,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              icons.length,
              (index) {
                return BaseIconButton(
                  onPressed: () =>
                      context.read<DashboardCubit>().setIndex(index),
                  visualDensity: const VisualDensity(),
                  padding: const EdgeInsets.all(10),
                  icon: Icon(
                    icons[index],
                    size: 20,
                    color: index == state.activeIndex
                        ? AppColors.primary
                        : AppColors.fade.withAlpha(153),
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
