import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/services/session/session_service.dart';
import '../../../../../shared/widgets/base/app_bar/base_app_bar.dart';
import '../../../../../shared/widgets/base/base_scaffold.dart';
import '../../../../../shared/widgets/base_title.dart';
import 'widgets/close_app_dialog.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      onPopInvokedWithResult: () => showCloseAppDialog(context),
      onRefresh: () async {},
      appBar: BaseAppBar(
        leading: const Icon(AppIcons.user, size: 20, color: AppColors.base),
        title: SessionUtil.I.fullName,
        titleFontWeight: FontWeight.w600,
      ),
      isScrollable: false,
      body: const Center(
        child: BaseTitle(title: "Home Page"),
      ),
    );
  }
}
