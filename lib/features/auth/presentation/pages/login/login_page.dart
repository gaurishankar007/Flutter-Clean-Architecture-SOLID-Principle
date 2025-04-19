import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/utils/extensions/string_extension.dart';
import '../../../../../core/utils/ui_helper.dart';
import '../../../../app/presentation/base_widgets/scaffold_widget.dart';
import '../../cubits/login/login_cubit.dart';
import '../../widgets/welcome_logo_widget.dart';
import 'widgets/login_button_widget.dart';
import 'widgets/login_form_widget.dart';

@RoutePage()
class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController =
        useTextEditingController(text: "username".debugOnly);
    final passwordController =
        useTextEditingController(text: "password".debugOnly);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return BlocProvider(
      create: (context) => GetIt.I<LoginCubit>(),
      child: ScaffoldWidget(
        showAnnotatedRegion: true,
        bottomNavigationBar: LoginButtonWidget(
          formKey: formKey,
          usernameController: usernameController,
          passwordController: passwordController,
        ),
        body: Column(
          children: [
            const WelcomeLogoWidget(title: "Login"),
            Container(
              margin: UIHelper.smallTxxLargeBPadding,
              child: Form(
                key: formKey,
                child: LoginFormWidget(
                  usernameController: usernameController,
                  passwordController: passwordController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
