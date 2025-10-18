import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared_ui/ui/base/buttons/primary_button.dart';
import '../../../cubits/login/login_cubit.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      loadableButton: true,
      expandWidth: true,
      onTap: () async {
        if (!formKey.currentState!.validate()) return;
        FocusManager.instance.primaryFocus?.unfocus();

        await context.read<LoginCubit>().fakeLogin(
          username: usernameController.text,
          password: passwordController.text,
        );
      },
      text: "LOGIN",
    );
  }
}
