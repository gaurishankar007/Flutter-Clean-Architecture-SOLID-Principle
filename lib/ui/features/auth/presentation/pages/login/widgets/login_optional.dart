import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/ui/base/base_checkbox.dart';
import '../../../../../../core/ui/base/buttons/base_text_button.dart';
import '../../../cubits/login/login_cubit.dart';

class LoginOptional extends StatelessWidget {
  final bool saveUserCredential;

  const LoginOptional({
    super.key,
    required this.saveUserCredential,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BaseCheckbox(
          value: saveUserCredential,
          title: "Stay Logged In",
          onChanged: (value) =>
              context.read<LoginCubit>().toggleUserCredentialSaving(),
        ),
        BaseTextButton(
          onPressed: () {},
          text: "Forget Password?",
        ),
      ],
    );
  }
}
