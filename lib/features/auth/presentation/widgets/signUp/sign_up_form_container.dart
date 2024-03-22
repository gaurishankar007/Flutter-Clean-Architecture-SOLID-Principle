import 'package:flutter/material.dart';

import '../../../../../core/extensions/int_extension.dart';
import '../../../../../widgets/custom_text_form.dart';
import '../../arguments/sign_up_argument.dart';

class SignUpFormContainer extends StatelessWidget {
  final SignUpArgument argument;

  const SignUpFormContainer({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextForm(
          onChanged: (value) => argument.nameController.sink.add(value ?? ""),
          inputDecoration: const InputDecoration(hintText: "Name"),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.propHeight),
          child: CustomTextForm(
            textFormKey: const ValueKey("EmailHintText"),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => argument.emailController.sink.add(value ?? ""),
            inputDecoration: const InputDecoration(hintText: "Email"),
          ),
        ),
        CustomTextForm(
          onChanged: (value) => argument.passwordController.sink.add(value ?? ""),
          obscureText: true,
          inputDecoration: const InputDecoration(hintText: "Password"),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.propHeight),
          child: CustomTextForm(
            onChanged: (value) => argument.confirmPasswordController.sink.add(value ?? ""),
            obscureText: true,
            inputDecoration: const InputDecoration(hintText: "Confirm Password"),
          ),
        ),
      ],
    );
  }
}
