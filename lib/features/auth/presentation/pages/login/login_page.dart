import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/utils/ui_helpers.dart';
import '../../../../../shared/widgets/base/base_scaffold.dart';
import '../../cubits/login/login_cubit.dart';
import '../../widgets/welcome_logo.dart';
import 'widgets/login_button.dart';
import 'widgets/login_form.dart';

@RoutePage()
class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return BlocProvider(
      create: (context) => GetIt.I<LoginCubit>(),
      child: BaseScaffold(
        showAnnotatedRegion: true,
        bottomNavigationBar: LoginButton(
          formKey: formKey,
          usernameController: usernameController,
          passwordController: passwordController,
        ),
        body: Column(
          children: [
            const WelcomeLogo(title: "Login"),
            Container(
              margin: UIHelpers.smallTxxLargeBPadding,
              child: Form(
                key: formKey,
                child: LoginForm(
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
