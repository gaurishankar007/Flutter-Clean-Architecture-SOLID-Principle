import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../domain/forms/sign_up_form.dart';
import '../../arguments/sign_up_argument.dart';
import '../../cubit/auth_cubit.dart';

class SignUpButton extends StatelessWidget {
  final SignUpArgument argument;

  const SignUpButton({
    super.key,
    required this.argument,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Rx.combineLatest4(
        argument.nameController,
        argument.emailController,
        argument.passwordController,
        argument.confirmPasswordController,
        (a, b, c, d) => true,
      ),
      builder: (context, snapshot) {
        String? name = argument.nameController.stream.valueOrNull;
        String? email = argument.emailController.stream.valueOrNull;
        String? password = argument.passwordController.stream.valueOrNull;
        String? confirmPassword = argument.confirmPasswordController.stream.valueOrNull;

        bool disabled = (name ?? "").isEmpty ||
            (email ?? "").isEmpty ||
            (password ?? "").isEmpty ||
            (confirmPassword ?? "").isEmpty;

        return CustomElevatedButton(
          onTap: () async {
            AuthCubit authCubit = context.read<AuthCubit>();
            SignUpForm form = SignUpForm(
              name: name!,
              email: email!,
              password: password!,
              confirmPassword: confirmPassword!,
            );
            await authCubit.sigUp(form: form);
          },
          text: "Sign Up",
          expandWidth: true,
          disabled: disabled,
          showLoading: true,
        );
      },
    );
  }
}
