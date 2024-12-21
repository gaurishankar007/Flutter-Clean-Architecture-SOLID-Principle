import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_icon.dart';
import '../../../../../../core/utils/screen_util/screen_util.dart';
import '../../../../../../core/utils/ui_helper.dart';
import '../../../../../app/presentation/base_widgets/action/icon_button_widget.dart';
import '../../../cubits/dashboard/dashboard_cubit.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      AppIcon.home,
      AppIcon.setting,
    ];

    return Container(
      height: ScreenUtil.I.bottomNavigationHeight,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: UIHelper.sMediumTRadius,
        boxShadow: const [
          BoxShadow(
            color: AppColor.black10,
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
                return IconButtonWidget(
                  onPressed: () =>
                      context.read<DashboardCubit>().setIndex(index),
                  visualDensity: const VisualDensity(),
                  padding: const EdgeInsets.all(10),
                  icon: Icon(
                    icons[index],
                    size: 20,
                    color: index == state.activeIndex
                        ? AppColor.primary
                        : AppColor.fade.withAlpha(153),
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
