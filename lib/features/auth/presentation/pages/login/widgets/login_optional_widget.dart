import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/presentation/base_widgets/action/checkbox_widget.dart';
import '../../../../../app/presentation/base_widgets/action/text_button_widget.dart';
import '../../../cubits/login/login_cubit.dart';

class LoginOptionalWidget extends StatelessWidget {
  final bool saveUserCredential;

  const LoginOptionalWidget({
    super.key,
    required this.saveUserCredential,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CheckBoxWidget(
          value: saveUserCredential,
          title: "Stay Logged In",
          onChanged: (value) =>
              context.read<LoginCubit>().toggleUserCredentialSaving(),
        ),
        TextButtonWidget(
          onPressed: () {},
          text: "Forget Password?",
        ),
      ],
    );
  }
}
