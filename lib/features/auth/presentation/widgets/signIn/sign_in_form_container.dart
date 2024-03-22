import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../widgets/custom_text_form.dart';

class SignInFormContainer extends StatelessWidget {
  final BehaviorSubject<String> emailController;
  final BehaviorSubject<String> passwordController;

  const SignInFormContainer({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    const borderRadius = Radius.circular(10);
    const emailTextFormBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.only(topLeft: borderRadius, topRight: borderRadius),
    );
    const passwordTextFormBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.only(bottomLeft: borderRadius, bottomRight: borderRadius),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextForm(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => emailController.sink.add(value ?? ""),
          inputDecoration: const InputDecoration(
            hintText: "Email",
            enabledBorder: emailTextFormBorder,
            focusedBorder: emailTextFormBorder,
          ),
        ),
        const SizedBox(height: 2),
        CustomTextForm(
          onChanged: (value) => passwordController.sink.add(value ?? ""),
          obscureText: true,
          inputDecoration: const InputDecoration(
            hintText: "Password",
            enabledBorder: passwordTextFormBorder,
            focusedBorder: passwordTextFormBorder,
          ),
        ),
      ],
    );
  }
}
