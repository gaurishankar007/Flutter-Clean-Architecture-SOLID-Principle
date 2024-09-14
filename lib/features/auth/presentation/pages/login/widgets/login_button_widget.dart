import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/presentation/base_widgets/action/primary_button_widget.dart';
import '../../../cubits/login/login_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginButtonWidget({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      loadableButton: true,
      expandWidth: true,
      onTap: () async {
        if (!formKey.currentState!.validate()) return;
        FocusManager.instance.primaryFocus?.unfocus();

        await context.read<LoginCubit>().login(
              username: usernameController.text,
              password: passwordController.text,
            );
      },
      text: "LOGIN",
    );
  }
}
