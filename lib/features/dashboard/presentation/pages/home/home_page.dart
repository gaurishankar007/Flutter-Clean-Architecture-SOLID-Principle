import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/services/session/session_service.dart';
import '../../../../app/presentation/base_widgets/app_bar/app_bar_widget.dart';
import '../../../../app/presentation/base_widgets/scaffold_widget.dart';
import '../../../../app/presentation/widgets/title_widget.dart';
import 'widgets/close_app_dialog.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      onPopInvokedWithResult: () => showCloseAppDialog(context),
      onRefresh: () async {},
      appBar: AppBarWidget(
        leading: const Icon(AppIcons.user, size: 20, color: AppColors.base),
        title: SessionUtil.I.fullName,
        titleFontWeight: FontWeight.w600,
      ),
      isScrollable: false,
      body: const Center(
        child: TitleWidget(title: "Home Page"),
      ),
    );
  }
}
